package com.example.vtb_hack

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("4495ba4b-041a-4f3e-9e20-908491db1419")
        super.configureFlutterEngine(flutterEngine)
    }
}
