class Device {
  /// Unique identifier for the device
  final String deviceId;

  /// Name or alias of the device
  final String deviceName;

  /// Lock status of the device
  bool isLocked;

  /// Last known location of the device
  String lastKnownLocation;

  /// Timestamp of the last activity or update
  DateTime lastUpdated;

  /// Constructor for creating a Device instance
  Device({
    required this.deviceId,
    required this.deviceName,
    this.isLocked = false,
    this.lastKnownLocation = 'Unknown',
    DateTime? lastUpdated,
  }) : lastUpdated = lastUpdated ?? DateTime.now();

  /// Lock the device
  void lockDevice() {
    isLocked = true;
    lastUpdated = DateTime.now();
  }

  /// Unlock the device
  void unlockDevice() {
    isLocked = false;
    lastUpdated = DateTime.now();
  }

  /// Update the location of the device
  void updateLocation(String location) {
    lastKnownLocation = location;
    lastUpdated = DateTime.now();
  }

  /// Convert the Device instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'deviceId': deviceId,
      'deviceName': deviceName,
      'isLocked': isLocked,
      'lastKnownLocation': lastKnownLocation,
      'lastUpdated': lastUpdated.toIso8601String(),
    };
  }

  /// Create a Device instance from a JSON object
  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      deviceId: json['deviceId'],
      deviceName: json['deviceName'],
      isLocked: json['isLocked'] ?? false,
      lastKnownLocation: json['lastKnownLocation'] ?? 'Unknown',
      lastUpdated: DateTime.parse(json['lastUpdated']),
    );
  }
}
