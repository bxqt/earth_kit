package de.bendix.earth_kit.opengl

import android.annotation.SuppressLint
import android.content.Context
import android.content.res.Configuration
import android.graphics.PixelFormat
import android.opengl.GLSurfaceView

import android.opengl.GLES30.*
import android.os.Build
import androidx.annotation.CallSuper
import androidx.annotation.NonNull
import androidx.annotation.RequiresApi
import de.bendix.earth_kit.opengl.renderer.HeatmapRenderer
import de.bendix.earth_kit.opengl.renderer.PolygonRenderer
import de.bendix.earth_kit.opengl.util.EarthState
import de.bendix.earth_kit.util.toObject
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.nio.FloatBuffer
import java.nio.ShortBuffer
import javax.microedition.khronos.egl.EGLConfig
import javax.microedition.khronos.opengles.GL10

class OpenGLRenderViewFactory(
    private val messenger: BinaryMessenger
) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    companion object {
        const val ID = "gl_texture"
    }

    override fun create(context: Context, id: Int, args: Any?): PlatformView {
        val type = args as? String ?: throw IllegalArgumentException("Every texture must have a unique identifier!")
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR2) {
            OpenGLRenderView(context, messenger, id, type)
        } else {
            throw IllegalStateException("Tried to instantiate GLRenderView on API below 18")
        }
    }
}

@RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
@SuppressLint("ViewConstructor")
class OpenGLRenderView(
    context: Context,
    messenger: BinaryMessenger,
    id: Int,
    type: String
) : GLSurfaceView(context), PlatformView, MethodChannel.MethodCallHandler {

    private val channel: MethodChannel
    private val renderer: OpenGLRenderer

    init {
        setEGLConfigChooser(8, 8, 8, 8, 16, 0)
        holder.setFormat(PixelFormat.RGBA_8888)
        setEGLContextClientVersion(3)

        renderer = when (type) {
            "polygon" -> PolygonRenderer()
            "heatmap" -> HeatmapRenderer()
            else -> throw IllegalArgumentException("$type is not a valid type. Must be 'polygon' or 'heatmap'.")
        }.also { setRenderer(it) }

        renderMode = RENDERMODE_WHEN_DIRTY

        channel = MethodChannel(messenger, "${OpenGLRenderViewFactory.ID}_$id")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        when (call.method) {
            "onDataChanged" -> {
                renderer.data = call.arguments
                requestRender()
            }
            "onStateChanged" -> {
                val args = call.arguments as? HashMap<*, *> ?: return
                renderer.state = args.toObject()
                requestRender()
            }
            else -> result.notImplemented()
        }
    }

    override fun onSizeChanged(w: Int, h: Int, oldw: Int, oldh: Int) {
        super.onSizeChanged(w, h, oldw, oldh)
        requestRender()
    }

    override fun getView() = this
    override fun dispose() = renderer.dispose()
}

abstract class OpenGLRenderer : GLSurfaceView.Renderer {

    open var data: Any? = null
    open var state: EarthState? = null

    // We store the last transmitted data here,
    // because on orientation changes, onSurfaceCreated is invoked
    // and we have to recompile all shaders, textures, buffers, etc.
    private var lastData: Any? = null
    private var lastState: EarthState? = null

    final override fun onSurfaceCreated(unused: GL10, config: EGLConfig) {
        glClearColor(0f, 0f, 0f, 0f)
        onCreated()

        onData(lastData)
        onState(lastState ?: return)
    }

    abstract fun onCreated()

    final override fun onDrawFrame(unused: GL10) {
        glClear(GL_COLOR_BUFFER_BIT)

        data?.also { onData(it) }
        data = null

        state?.also { onState(it) }
        state = null

        onDraw()
    }

    abstract fun onDraw()

    @CallSuper
    open fun onData(data: Any?) {
        // lastData = data
    }

    @CallSuper
    open fun onState(state: EarthState) {
        lastState = state
    }

    override fun onSurfaceChanged(unused: GL10, width: Int, height: Int) {
        glViewport(0, 0, width, height)
    }

    open fun dispose() {}
}

internal fun allocateFloats(array: FloatArray): FloatBuffer {
    return ByteBuffer.allocateDirect(array.size * 4).run {
        order(ByteOrder.nativeOrder())
        asFloatBuffer().apply {
            put(array)
            position(0)
        }
    }
}

internal fun allocateShorts(array: ShortArray): ShortBuffer {
    return ByteBuffer.allocateDirect(array.size * 2).run {
        order(ByteOrder.nativeOrder())
        asShortBuffer().apply {
            put(array)
            position(0)
        }
    }
}

