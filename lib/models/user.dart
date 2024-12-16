import 'device.dart';

class User {
  /// Email ID of the user (acts as a unique identifier)
  final String email;

  /// Encrypted password of the user
  String password;

  /// List of devices associated with the user
  List<Device> linkedDevices;

  /// Constructor for creating a User instance
  User({
    required this.email,
    required this.password,
    List<Device>? devices,
  }) : linkedDevices = devices ?? [];

  /// Add a new device to the user account
  void addDevice(Device device) {
    linkedDevices.add(device);
  }

  /// Remove a device from the user account
  bool removeDevice(String deviceId) {
    final initialCount = linkedDevices.length;
    linkedDevices.removeWhere((device) => device.deviceId == deviceId);
    return linkedDevices.length < initialCount;
  }

  /// Find a device by ID
  Device findDevice(String deviceId) {
    return linkedDevices.firstWhere(
          (device) => device.deviceId == deviceId,
      orElse: () => throw Exception("Device with ID $deviceId not found."),
    );
  }


  /// Convert the User instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'linkedDevices': linkedDevices.map((device) => device.toJson()).toList(),
    };
  }

  /// Create a User instance from a JSON object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
      devices: (json['linkedDevices'] as List<dynamic>?)
          ?.map((deviceJson) => Device.fromJson(deviceJson))
          .toList() ??
          [],
    );
  }
}
