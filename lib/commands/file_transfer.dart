// file_transfer.dart
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<String?> uploadFileToApi(File file) async {
  try {
    List<int> fileBytes = await file.readAsBytes();
    String base64File = base64Encode(fileBytes);

    var body = jsonEncode({
      'file': base64File,
      'filename': file.path.split('/').last,
    });

    // Replace this URL with your actual API endpoint
    var urlApi = 'https://example.com/upload';

    var response = await http.post(
      Uri.parse(urlApi),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      return responseBody['file_url']; // Adjust based on your API's response
    } else {
      print('Failed to upload file: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error uploading file: $e');
    return null;
  }
}
