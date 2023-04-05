import 'package:logger/logger.dart';

/// Logger for printing logs
class AppLogger {
  ///Instance of Logger
  Logger logger = Logger();

  ///print debug message
  void logDebug({required final String message}) => logger.d(message);

  ///print error message
   void logError({
    required final String message,
    dynamic error,
    final StackTrace? stackTrace,
  }) =>
      logger.e(message, error, stackTrace);
}
