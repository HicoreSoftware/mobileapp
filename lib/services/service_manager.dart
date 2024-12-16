import 'background_service.dart';
import 'i_service.dart';

class ServiceManager {
  // Instance of BackgroundService
  late BackgroundService _backgroundService;

  // Constructor for initializing the services
  ServiceManager() {
    _backgroundService = BackgroundService();
  }

  // Start all services
  void startServices() {
    // Start the background service
    _backgroundService.startService();
    print("All services started.");
  }

  // Stop all services
  void stopServices() {
    // Stop the background service
    _backgroundService.stopService();
    print("All services stopped.");
  }
}
