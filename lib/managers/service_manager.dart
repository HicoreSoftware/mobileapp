import 'dart:async';
import '../core/logger.dart';

class ServiceManager {
  static final ServiceManager _instance = ServiceManager._internal();

  /// Singleton instance
  factory ServiceManager() => _instance;

  ServiceManager._internal();

  Timer? _periodicServiceTimer;

  /// Start a periodic service to monitor device status
  void startPeriodicService({int intervalInSeconds = 10}) {
    Logger.log("Starting periodic service...");

    _periodicServiceTimer = Timer.periodic(Duration(seconds: intervalInSeconds), (timer) {
      _executePeriodicTask();
    });

    Logger.log("Periodic service started with an interval of $intervalInSeconds seconds.");
  }

  /// Stop the periodic service
  void stopPeriodicService() {
    Logger.log("Stopping periodic service...");
    _periodicServiceTimer?.cancel();
    Logger.log("Periodic service stopped.");
  }

  /// Simulated periodic task execution
  void _executePeriodicTask() {
    Logger.log("Executing periodic task: Checking device status...");
    // Simulate task: Check security status, sync data, etc.
  }

  /// Restart the periodic service
  void restartService({int intervalInSeconds = 10}) {
    stopPeriodicService();
    startPeriodicService(intervalInSeconds: intervalInSeconds);
  }
}
