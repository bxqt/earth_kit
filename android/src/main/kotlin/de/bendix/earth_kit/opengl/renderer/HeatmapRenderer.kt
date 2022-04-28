package de.bendix.earth_kit.opengl.renderer

import android.opengl.GLES30.*
import android.os.Build
import android.util.Log
import androidx.annotation.RequiresApi
import de.bendix.earth_kit.opengl.*
import de.bendix.earth_kit.opengl.buffers.*
import de.bendix.earth_kit.opengl.renderer.projections.ORTHOGRAPHIC_INVERT
import de.bendix.earth_kit.opengl.util.*
import de.bendix.earth_kit.util.toObject

@RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
class HeatmapRenderer : OpenGLRenderer() {
    private val shader by lazy { Shader() }
    private val vertexArray by lazy { VertexArray() }
    private val indexBuffer by lazy { IndexBuffer() }
    private val vertexBuffer by lazy { VertexBuffer() }
    private val heatmaps by lazy { ArrayTexture() }

    override fun onCreated() {
        shader.compile(vertexShader, fragmentShader)
        vertexArray.create()
        indexBuffer.create()
        vertexBuffer.create()
        heatmaps.create()

        createVertices()
    }

    override fun onDraw() {
        shader.use()
        heatmaps.bind()

        vertexArray.bind()
        glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_SHORT, 0)
        vertexArray.unbind()
    }

    override fun onData(data: Any?) {
        super.onData(data)
        // Fields that didn't change are null.
        val json = data as? HashMap<*, *> ?: return

        (json["heatmaps"] as? List<List<List<Float>>>)?.also { heatmaps ->
            this.heatmaps.setTextures(heatmaps)
        }

        (json["index"] as? Double)?.also { index ->
            shader.set1f("index", index.toFloat())
        }

        (json["scale"] as? List<HashMap<String, *>>)?.also { scale ->
            uploadColorScale(scale)
        }

        (json["interpolate"] as? Boolean)?.also { interpolate ->
            shader.set1i("interpolate", if (interpolate) 1 else 0)
        }
    }

    override fun onState(state: EarthState) {
        super.onState(state)

        state.origin.apply { shader.set2f("origin", latitude, longitude) }

        val width = state.size.width
        val height = state.size.height
        val parentWidth = state.parentSize.width
        val parentHeight = state.parentSize.height
        shader.set2f("scalar", parentWidth / width, parentHeight / height)
    }

    private fun uploadColorScale(scale: List<HashMap<*, *>>) {
        val stops = scale.map { it.toObject<ColorStop>() }

        shader.set1i("thresholdCount", stops.size)
        shader.set1fv("thresholds", stops.map { it.value }.toFloatArray())
        shader.set4fv("colors", stops.map { it.color.toFloatArray() })
    }

    private fun createVertices() {
        val vertices = floatArrayOf(
            1f, 1f, 0f, // top-right
            1f, -1f, 0f, // bottom-right
            -1f, -1f, 0f, // bottom-left
            -1f, 1f, 0f // top-left
        )

        val indices = shortArrayOf(
            0, 1, 2,
            0, 2, 3
        )

        // 1. Bind Vertex Array Object
        vertexArray.bind()
        // 2. Copy our vertices array in a vertex buffer for OpenGL to use
        vertexBuffer.setVertices(vertices)
        // 3. Copy our index array in a element buffer for OpenGL to use
        indexBuffer.setIndices(indices)
        // 4. Then set the vertex attributes pointers
        vertexArray.addBuffer(floats(3))
    }

    override fun dispose() {
        shader.free()
        listOf(heatmaps, vertexBuffer, vertexArray, indexBuffer).forEach { it.free() }
    }
}

private val vertexShader = """     
    #version 300 es
    layout(location = 0) in vec3 position;
    uniform highp vec2 scalar;
    
    out highp vec2 pos;
    
    void main() {
        pos = vec2(position.xy) * scalar;
        gl_Position = vec4(position, 1.0);
    }
    """.trimIndent()

private val fragmentShader = """     
    #version 300 es
    precision highp float;
    
    uniform sampler2DArray heatmaps;
    uniform highp vec2 origin;
    uniform int interpolate;
    uniform float index;
    
    uniform vec4 colors[20];
    uniform float thresholds[20];
    uniform int thresholdCount;
    
    in highp vec2 pos;
    out vec4 fragColor;
            
    const vec2 outsideProjection = vec2(9999.0, -9999.0);
    $ORTHOGRAPHIC_INVERT
    
    vec4 color(float value) {
        for (int i = 0; i < 20; i++) {
            float threshold = thresholds[i];
            if (value <= threshold) {
                if (i == 0) {
                    return colors[i];
                } else {
                    if (interpolate == 0) {
                        return colors[i];
                    } else {
                        float t = (value - thresholds[i - 1]) / (threshold - thresholds[i - 1]);
                        return mix(colors[i - 1], colors[i], t);
                    }
                }
            } else if (i >= (thresholdCount - 1)) {
                return colors[thresholdCount - 1];
            }
        }
        
        return vec4(0.0, 0.0, 0.0, 0.0);
    }

    void main() {
        vec2 latLng = invert(origin, pos);
        
        if (latLng != outsideProjection) {
            float y = (latLng.x +  90.0) / 180.0;
            float x = (latLng.y + 180.0) / 360.0;
            float v0 = texture(heatmaps, vec3(x, y, floor(index))).r;
            float v1 = texture(heatmaps, vec3(x, y, ceil(index))).r;
            float value = mix(v0, v1, index - floor(index));
            vec4 c = color(value);
            fragColor = c * c.a;
        } else {
            fragColor = vec4(0.0, 0.0, 0.0, 0.0);
        }
    }
    """.trimIndent()
