import 'package:flutter/material.dart';
import '../core/logger.dart';

class GuiManager {
  static final GuiManager _instance = GuiManager._internal();

  /// Singleton instance
  factory GuiManager() => _instance;

  GuiManager._internal();

  /// Show a notification/snackbar in the app
  void showNotification(BuildContext context, String message, {bool isError = false}) {
    Logger.log("Showing notification: $message");

    final color = isError ? Colors.red : Colors.green;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: color,
      ),
    );
  }

  /// Show a loading indicator
  Widget buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  /// Show a simple alert dialog
  Future<void> showAlertDialog(BuildContext context, String title, String message) async {
    Logger.log("Showing alert dialog: $title");

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
