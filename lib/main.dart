import 'dart:async';

import 'package:arava/modules/app_module.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sentry/sentry.dart' as sentry;


void main() {
  final sentryClient = sentry.SentryClient(dsn: "https://4aaee05198044a30b7480dac58957f14@sentry.io/2088250");
  final appModule = AppModule();
  runZoned(() => runApp(ModularApp(module: appModule)), onError: (exception, stackTrace) async {
    // Print the exception to the console.
    print('Caught error: $exception');
    if (kDebugMode) {
      // Print the full stacktrace in debug mode.
      print(stackTrace);
      return;
    } else {
      final response = await sentryClient.captureException(
        exception: exception,
        stackTrace: stackTrace,
      );
      debugPrint(
        "Exception captured and sent to Sentury with ${response.isSuccessful ? "success" : "failure"} :\n"
          "Error : ${response.error}\n"
          "Event id : ${response.eventId}"
      );
    }
    FlutterError.onError = (FlutterErrorDetails details) {
      if (kDebugMode) {
        // In development mode, simply print to console.
        FlutterError.dumpErrorToConsole(details);
      } else {
        // In production mode, report to the application zone to report to
        // Sentry.
        Zone.current.handleUncaughtError(details.exception, details.stack);
      }
    };
  });
}
