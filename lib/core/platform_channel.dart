import 'package:flutter/services.dart';
import '../core//logger.dart';

class PlatformChannelManager {
  static const MethodChannel _channel = MethodChannel('com.example.lock_device');

  /// Locks the device via native platform code.
  Future<void> lockDevice() async {
    try {
      await _channel.invokeMethod('lockDevice');
      Logger.log("Device lock command sent to platform.");
    } catch (e) {
      Logger.error("Failed to lock device: $e");
    }
  }

  /// Unlocks the device via native platform code.
  Future<void> unlockDevice() async {
    try {
      await _channel.invokeMethod('unlockDevice');
      Logger.log("Device unlock command sent to platform.");
    } catch (e) {
      Logger.error("Failed to unlock device: $e");
    }
  }
}
