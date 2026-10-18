package com.ecomins.groundseva.ground_seva_worker

import android.view.KeyEvent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.engine.FlutterEngine
import android.os.SystemClock

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.ecomins.groundseva/sos"
    private var methodChannel: MethodChannel? = null
    private val SOS_PRESS_COUNT = 3
    private val SOS_TIME_WINDOW = 2000L // 2 seconds

    private var pressTimestamps = ArrayList<Long>()

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        methodChannel?.setMethodCallHandler { call, result ->
            if (call.method == "isSosActive") {
                result.success(true)
            } else {
                result.notImplemented()
            }
        }
    }

    override fun dispatchKeyEvent(event: KeyEvent): Boolean {
        val action = event.action
        val keyCode = event.keyCode

        if (keyCode == KeyEvent.KEYCODE_VOLUME_DOWN) {
            if (action == KeyEvent.ACTION_DOWN) {
                val currentTime = SystemClock.elapsedRealtime()
                // Remove timestamps outside the window
                pressTimestamps.removeAll { currentTime - it > SOS_TIME_WINDOW }
                pressTimestamps.add(currentTime)

                if (pressTimestamps.size >= SOS_PRESS_COUNT) {
                    pressTimestamps.clear()
                    methodChannel?.invokeMethod("triggerSos", null)
                }
            }
            return super.dispatchKeyEvent(event)
        }
        return super.dispatchKeyEvent(event)
    }
}
