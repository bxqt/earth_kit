package de.bendix.earth_kit

import androidx.annotation.NonNull;
import de.bendix.earth_kit.opengl.OpenGLRenderViewFactory
import de.bendix.earth_kit.util.toObject

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.view.TextureRegistry

class EarthKitPlugin : FlutterPlugin {
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        val messenger = flutterPluginBinding.binaryMessenger
        channel = MethodChannel(messenger, "earth_kit")

        registerPlatformViews(flutterPluginBinding)
    }

    private fun registerPlatformViews(binding: FlutterPlugin.FlutterPluginBinding) {
        binding.platformViewRegistry.apply {
            val messenger = binding.binaryMessenger
            registerViewFactory(OpenGLRenderViewFactory.ID, OpenGLRenderViewFactory(messenger))
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
