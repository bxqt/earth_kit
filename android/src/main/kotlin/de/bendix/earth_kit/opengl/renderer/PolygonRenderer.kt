package de.bendix.earth_kit.opengl.renderer

import android.opengl.GLES30.*
import android.os.Build
import android.util.Log
import androidx.annotation.RequiresApi
import de.bendix.earth_kit.opengl.OpenGLRenderer
import de.bendix.earth_kit.opengl.Shader
import de.bendix.earth_kit.opengl.buffers.VertexArray
import de.bendix.earth_kit.opengl.buffers.VertexBuffer
import de.bendix.earth_kit.opengl.buffers.floats
import de.bendix.earth_kit.opengl.renderer.projections.ORTHOGRAPHIC_PROJECT
import de.bendix.earth_kit.opengl.util.EarthState
import de.bendix.earth_kit.opengl.util.Polygon
import de.bendix.earth_kit.util.toObject
import java.lang.ClassCastException
import javax.microedition.khronos.egl.EGLConfig
import javax.microedition.khronos.opengles.GL10

@RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
class PolygonRenderer : OpenGLRenderer() {
    private val TAG = "PolygonRenderer"

    private val shader by lazy { Shader() }
    private val vertexArray by lazy { VertexArray() }
    private val polygons: MutableMap<Polygon, VertexBuffer> = HashMap()

    override fun onCreated() {
        shader.compile(vertexShader, fragmentShader)
    }

    override fun onDraw() {
        shader.use()
        vertexArray.bind()

        for (entry in polygons) {
            val polygon = entry.key
            val buffer = entry.value

            polygon.colorVec.also { shader.set4f("color", it[0], it[1], it[2], it[3]) }

            buffer.bind()
            glLineWidth(10f)
            glDrawArrays(GL_LINES, 0, polygon.vertices.size / 2)
        }

        vertexArray.unbind()
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

    override fun onData(data: Any?) {
        super.onData(data)

        val json = data as? HashMap<String, *> ?: return

        fun getPolygons(key: String): List<Polygon> {
            return (json[key] as? List<HashMap<String, *>>)?.let {
                it.map {
                    it.toObject<Polygon>()
                }
            } ?: emptyList()
        }

        getPolygons("added").also { polygons ->
            Log.d(TAG, "Added ${polygons.size} polygons")

            createVertices(polygons)
        }

        getPolygons("morphed").also { polygons ->
            Log.d(TAG, "Morphed ${polygons.size} polygons")

            createVertices(polygons)
        }

        getPolygons("updated").also { polygons ->
            Log.d(TAG, "Updated ${polygons.size} polygons")

            for (polygon in polygons) {
                val buffer = this.polygons.remove(polygon)
                this.polygons[polygon] = buffer ?: continue
            }
        }

        getPolygons("removed").also { polygons ->
            Log.d(TAG, "Removed ${polygons.size} polygons")

            for (polygon in polygons) {
                this.polygons.remove(polygon)
            }
        }
    }

    private fun createVertices(polygons: List<Polygon>) {
        vertexArray.bind()

        for (polygon in polygons) {
            this.polygons.remove(polygon)?.also { buffer -> buffer.free() }

            val buffer = VertexBuffer()

            val vertices = polygon.vertices.map {
                listOf(it.latitude, it.longitude)
            }.flatten().toFloatArray()

            buffer.setVertices(vertices)
            vertexArray.addBuffer(floats(2))

            this.polygons[polygon] = buffer
        }
    }

    override fun dispose() {
        shader.free()
    }
}

private val vertexShader = """
    #version 300 es
    layout(location = 0) in vec2 latLng;
    
    uniform highp vec2 scalar;
    uniform highp vec2 origin;
    
    const vec2 outsideProjection = vec2(9999.0, -9999.0);
    $ORTHOGRAPHIC_PROJECT
    
    void main() {
        vec2 offset = project(origin, latLng);
        
        if (offset != outsideProjection) {
            gl_Position = vec4(offset * scalar, 0.0, 1.0);
        } else {
            gl_Position = vec4(2.0, -2.0, 0.0, 1.0);
        }
    }
    """.trimIndent()

private val fragmentShader = """
    #version 300 es
    
    uniform vec4 color;
    out vec4 glColor;
    
    void main() {
        glColor = vec4(1.0, 1.0, 1.0, 1.0);
    }
    """.trimIndent()