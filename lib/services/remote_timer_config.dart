import 'dart:async';
import 'package:mobileapp/utils/api_config.dart';

class RemoteTimerConfig {
  Future<void> start(int duration) async {
    String urlApi = APIConfig.urlApi; // Use the API path from the config
    print("Starting timer with duration: $duration seconds and API: $urlApi");

    // Example timer logic
    await Future.delayed(Duration(seconds: duration), () {
      print("Timer completed after $duration seconds.");
      // Add your execution logic here (e.g., call the API, perform tasks, etc.)
    });
  }
}
