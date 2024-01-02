part of '../logger_kit.dart';

class LoggerRecord {
  final String name;
  final String message;
  final DateTime time;
  final dynamic error;
  final StackTrace? stackTrace;

  /// {@macro logger_record}
  LoggerRecord(
    this.message, {
    this.name = '',
    this.error,
    this.stackTrace,
    DateTime? time,
  }) : time = time ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'time': time.toString(),
      'name': name,
      'error': error?.toString(),
      'stackTrace': stackTrace.toString(),
    };
  }

  factory LoggerRecord.fromJson(Map json) {
    return LoggerRecord(
      json['message'] as String,
      time: DateTime.parse(json['time'] as String),
      name: json['name'] as String,
      error: json['error'],
      stackTrace: json['stackTrace'] != null
          ? StackTrace.fromString(json['stackTrace'] as String)
          : null,
    );
  }

  @override
  String toString() =>
      '$time - [$name] $message ${error != null ? '\n$error' : ''} \n$stackTrace';
}
