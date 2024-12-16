import 'package:flutter/material.dart';

class DeviceLockUI extends StatefulWidget {
  @override
  _DeviceLockUIState createState() => _DeviceLockUIState();
}

class _DeviceLockUIState extends State<DeviceLockUI> {
  bool isLocked = false;

  // Simulating lock/unlock command
  void toggleLock() {
    setState(() {
      isLocked = !isLocked;
    });

    // You can invoke the platform channel here to lock/unlock the device.
    if (isLocked) {
      print("Device is locked.");
    } else {
      print("Device is unlocked.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Device Lock")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isLocked ? Icons.lock : Icons.lock_open,
              size: 100,
              color: isLocked ? Colors.red : Colors.green,
            ),
            SizedBox(height: 20),
            Text(
              isLocked ? "Device is Locked" : "Device is Unlocked",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: toggleLock,
              child: Text(isLocked ? "Unlock Device" : "Lock Device"),
            ),
          ],
        ),
      ),
    );
  }
}
