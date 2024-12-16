import 'dart:async';
import 'package:flutter/services.dart';
import 'i_service.dart';

class BackgroundService implements IService {
  // Interval for checking commands (30 seconds)
  static const int interval = 30;

  // Timer to manage the periodic execution
  Timer? _timer;

  // Method to start the background service
  @override
  void startService() {
    // Initiating the periodic check for commands
    _timer = Timer.periodic(Duration(seconds: interval), (timer) {
      _checkForCommands();
    });
  }

  // Method to stop the background service
  @override
  void stopService() {
    // Cancelling the periodic timer
    _timer?.cancel();
  }

  // This method simulates checking for new commands from a cloud server
  void _checkForCommands() {
    print("Checking for commands...");

    // Example: If we receive a command to lock the device, we execute it
    // You can integrate actual cloud communication logic here
    executeLockCommand();
  }

  // Example method to execute a lock command
  void executeLockCommand() {
    print("Lock command executed.");

    // Example: Lock the device via platform channel
    _lockDevice();
  }

  // Lock the device using platform channels (this is a placeholder)
  Future<void> _lockDevice() async {
    try {
      // Using platform channels to communicate with native Android/iOS code
      await MethodChannel('com.example.app/lock').invokeMethod('lockDevice');
      print("Device Locked");
    } on PlatformException catch (e) {
      print("Failed to lock device: ${e.message}");
    }
  }
}
