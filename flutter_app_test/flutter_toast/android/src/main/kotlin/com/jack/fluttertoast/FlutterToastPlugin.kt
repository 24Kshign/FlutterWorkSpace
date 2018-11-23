package com.jack.fluttertoast

import android.content.Context
import android.text.TextUtils
import android.util.Log
import android.widget.Toast
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import org.json.JSONArray
import org.json.JSONException
import org.json.JSONObject

class FlutterToastPlugin(private val registrar: Registrar) : MethodCallHandler {
    companion object {

        @JvmStatic
        val TAG: String = FlutterToastPlugin::class.java.simpleName

        const val JSON_INDENT: Int = 2

        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channelToast = MethodChannel(registrar.messenger(), "flutter_toast")
            channelToast.setMethodCallHandler(FlutterToastPlugin(registrar))

            val channelLog = MethodChannel(registrar.messenger(), "flutter_log")
            channelLog.setMethodCallHandler(FlutterToastPlugin(registrar))
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        val context = registrar.context()
        val message = call.argument<String?>("message")
        val content = call.argument<String?>("content")
        var tag = call.argument<String?>("tag")
        if (TextUtils.isEmpty(message) && TextUtils.isEmpty(content)) {
            result.error(TAG, "错误：参数错误", null)
            return
        }

        if (TextUtils.isEmpty(tag)) {
            tag = "TAG"
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
            "verbose" -> {
                Log.v(tag, content)
                result.success(null)
            }
            "debug" -> {
                Log.d(tag, content)
                result.success(null)
            }
            "info" -> {
                Log.i(tag, content)
                result.success(null)
            }
            "warn" -> {
                Log.w(tag, content)
                result.success(null)
            }
            "error" -> {
                Log.e(tag, content)
                result.success(null)
            }
            "json" -> {
                Log.e(tag, getPrettyJson(content))
                result.success(null)
            }
            else -> result.notImplemented()
        }
    }

    private fun getPrettyJson(json: String?): String {
        var jsonStr = json
        jsonStr?.let { it ->
            try {
                jsonStr = it.trim { it <= ' ' }
                if (it.startsWith("{")) {
                    val jsonObject = JSONObject(it)
                    return jsonObject.toString(JSON_INDENT)
                }
                if (it.startsWith("[")) {
                    val jsonArray = JSONArray(it)
                    return jsonArray.toString(JSON_INDENT)
                }
            } catch (e: JSONException) {
                e.printStackTrace()
            }
        }
        return "Invalid Json, Please Check: $jsonStr"
    }

    private fun showToast(context: Context, message: String?, duration: Int) = Toast.makeText(context, message, duration).show()
}
