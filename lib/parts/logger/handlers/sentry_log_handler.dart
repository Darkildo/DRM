part of '../logger_kit.dart';

class SentryHandler extends LogHandler<LoggerRecord> {
  final printer = PrettyPrinter();

  @override
  void handle(RecordData<LoggerRecord> data) {
    if (!kDebugMode && Sentry.isEnabled) {
      Sentry.captureException(
        data.record.error,
        stackTrace: data.record.stackTrace,
      );
      
    }
  }
  @override
  Future<void> dispose() => Sentry.close();
}
