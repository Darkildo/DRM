import 'dart:convert';

import 'package:de_log/de_log.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:sentry/sentry.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'handlers/print_handler.dart';
part 'handlers/sentry_log_handler.dart';
part 'models/pagination_log_loader.dart';
part 'models/renderable_record.dart';
part 'pretty_printer_handler.dart';
part 'records/logger_record.dart';

typedef AppLogger = DeLog<LoggerRecord>;
void appPrint(String message) {
  if (!kReleaseMode) {
    print(message);
  }
}

DeLog<LoggerRecord> initializeDeLog() => DeLog<LoggerRecord>(
      [
        if (!kReleaseMode) PrintHandler(),
        SentryHandler(),
      ],
    );
