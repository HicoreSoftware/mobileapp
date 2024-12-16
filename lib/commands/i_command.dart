/// ICommand interface for all commands.
///
/// Defines a contract for executing commands.
abstract class ICommand {
  /// Executes the command.
  /// This method will be implemented by all concrete command classes.
  Future<void> execute();

  /// Optionally, cancels or reverts the command execution.
  /// Default implementation is empty, can be overridden if needed.

}
