package com.jack.fluttertoast

import android.content.Context
import android.widget.Toast
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class FlutterToastPlugin(private val registrar: Registrar) : MethodCallHandler {
    companion object {

        @JvmStatic
        val TAG: String = FlutterToastPlugin::class.java.simpleName

        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "flutter_toast")
            channel.setMethodCallHandler(FlutterToastPlugin(registrar))
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        val context = registrar.context()
        val message = call.argument<String?>("message")
        if (message == null) {
            result.error(TAG, "错误：message参数错误", null)
            return
        }
        when (call.method) {
            "showShortToast" -> {
                showToast(context, message, Toast.LENGTH_SHORT)
                result.success(null)
            }
            "showLongToast" -> {
                showToast(context, message, Toast.LENGTH_LONG)
                result.success(null)
            }
            "showToast" -> {
                val duration = call.argument("duration") ?: Toast.LENGTH_SHORT
                showToast(context, message, duration)
                result.success(null)
            }
            else -> result.notImplemented()
        }
    }

    private fun showToast(context: Context, message: String, duration: Int) = Toast.makeText(context, message, duration).show()
}
