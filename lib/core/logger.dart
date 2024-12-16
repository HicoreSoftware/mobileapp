class Logger {
  /// Logs a message to the console.
  static void log(String message) {
    final time = DateTime.now().toIso8601String();
    print("[$time] LOG: $message");
  }

  /// Logs an error message.
  static void error(String error) {
    final time = DateTime.now().toIso8601String();
    print("[$time] ERROR: $error");
  }

  /// Logs a warning message.
  static void warn(String warning) {
    final time = DateTime.now().toIso8601String();
    print("[$time] WARNING: $warning");
  }
}
