class Constants {
  // API endpoints
  static const String BASE_URL = "https://yourapiurl.com";
  static const String REGISTER_URL = "/register";
  static const String LOGIN_URL = "/login";
  static const String DEVICE_COMMAND_URL = "/device/command";

  // SharedPreferences Keys
  static const String USER_EMAIL_KEY = "user_email";
  static const String USER_PIN_KEY = "user_pin";
  static const String IS_LOGGED_IN_KEY = "is_logged_in";

  // Default values
  static const String DEFAULT_PIN = "0000";

  // Timeout durations
  static const int TIMEOUT_DURATION = 30; // in seconds

  // Command types
  static const String COMMAND_LOCK = "lock";
  static const String COMMAND_UNLOCK = "unlock";
  static const String COMMAND_AUDIO = "audio";
  static const String COMMAND_LOCATION = "location";
  static const String COMMAND_PHOTO = "photo";
  static const String COMMAND_VIDEO = "video";
}

