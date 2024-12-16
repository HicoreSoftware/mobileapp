import 'i_command.dart';

/// LockCommand: Locks the device.
class LockCommand implements ICommand {
  @override
  Future<void> execute() async {
    print("LockCommand: Device is being locked...");
    // Add logic to lock the device
    // Example: Call platform channels to lock the phone
  }
}
