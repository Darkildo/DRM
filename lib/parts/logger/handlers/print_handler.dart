part of '../logger_kit.dart';

/// Выводит записи в консоль
class PrintHandler extends LogHandler<LoggerRecord> {
  final printer = PrettyPrinter();

  @override
  void handle(RecordData<LoggerRecord> data) {
    printer.print(data.record, data.level);
  }

  @override
  Future<void> dispose() => Future.value();
}
