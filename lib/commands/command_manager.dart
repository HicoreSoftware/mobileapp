import '../commands/i_command.dart';
import '../commands/lock_command.dart';
import '../commands/photo_command.dart';
import '../commands/audio_command.dart';
import '../commands/video_command.dart';
import '../commands/location_command.dart';

/// Enum representing the available commands.
enum CommandEnum { lock, photo, audio, video, location }

/// CommandManager class to manage command creation and execution.
class CommandManager {
  /// Singleton instance of CommandManager.
  static final CommandManager _instance = CommandManager._internal();

  /// Factory constructor to return the same instance.
  factory CommandManager() => _instance;

  /// Private constructor for singleton pattern.
  CommandManager._internal();

  /// Map to hold created command instances.
  final Map<CommandEnum, ICommand> _commandMap = {};

  /// Creates or retrieves a command instance based on the given CommandEnum.
  ICommand createCommand(CommandEnum commandType) {
    // Return existing command if already created
    if (_commandMap.containsKey(commandType)) {
      return _commandMap[commandType]!;
    }

    // Create a new command instance based on the command type
    late ICommand command;

    switch (commandType) {
      case CommandEnum.lock:
        command = LockCommand();
        break;
      case CommandEnum.photo:
        command = PhotoCommand();
        break;
      case CommandEnum.audio:
        command = AudioCommand();
        break;
      case CommandEnum.video:
        command = VideoCommand();
        break;
      case CommandEnum.location:
        command = LocationCommand();
        break;
    }

    // Cache the command instance
    _commandMap[commandType] = command;

    return command;
  }

  /// Executes the specified command.
  Future<void> executeCommand(CommandEnum commandType) async {
    final command = createCommand(commandType);
    print("Executing command: $commandType");
    await command.execute();
  }
}
