import 'package:http/http.dart' as http;
import 'dart:convert';
import '../core/logger.dart';

class SecurityAPI {
  final String _baseUrl;

  SecurityAPI(this._baseUrl);

  /// Sends a lock status to the server.
  Future<void> sendLockStatus(String deviceId, bool isLocked) async {
    final url = Uri.parse("$_baseUrl/lock_status");
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "device_id": deviceId,
          "is_locked": isLocked,
        }),
      );

      if (response.statusCode == 200) {
        Logger.log("Lock status sent successfully.");
      } else {
        Logger.error("Failed to send lock status: ${response.body}");
      }
    } catch (e) {
      Logger.error("Error sending lock status: $e");
    }
  }

  /// Uploads a file to the server.
  Future<void> uploadMedia(String deviceId, String mediaType, String filePath) async {
    final url = Uri.parse("$_baseUrl/upload_media");
    try {
      var request = http.MultipartRequest("POST", url);
      request.fields['device_id'] = deviceId;
      request.fields['media_type'] = mediaType;
      request.files.add(await http.MultipartFile.fromPath('file', filePath));

      var response = await request.send();
      if (response.statusCode == 200) {
        Logger.log("Media uploaded successfully.");
      } else {
        Logger.error("Failed to upload media. Status: ${response.statusCode}");
      }
    } catch (e) {
      Logger.error("Error uploading media: $e");
    }
  }

  /// Retrieves pending commands from the server.
  Future<List<dynamic>> getPendingCommands(String deviceId) async {
    final url = Uri.parse("$_baseUrl/get_commands?device_id=$deviceId");
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        Logger.log("Commands retrieved successfully.");
        return jsonDecode(response.body);
      } else {
        Logger.error("Failed to retrieve commands: ${response.body}");
        return [];
      }
    } catch (e) {
      Logger.error("Error retrieving commands: $e");
      return [];
    }
  }
}
