package com.example.batareykin

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    MapKitFactory.setApiKey("aa59b46f-384a-4fc4-bea7-22bbb7073541") // Your generated API key
    super.configureFlutterEngine(flutterEngine)
  }
}
