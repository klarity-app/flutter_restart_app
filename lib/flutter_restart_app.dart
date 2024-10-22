/// A library for restarting Flutter applications on desktop platforms.
///
/// This library provides functionality to restart Flutter applications on macOS, Windows, and Linux.
/// It offers a simple API to restart the application immediately or schedule a restart after a specified duration.
///
/// To use this library, import it as follows:
///
/// ```dart
/// import 'package:flutter_restart_app/flutter_restart_app.dart';
/// ```
///
/// Then, you can access the restart functionality through the instance of the [FlutterRestartApp] class.
library flutter_restart_app;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_restart_app/src/generated/api/common.dart';
import 'package:flutter_restart_app/src/generated/frb_generated.dart';

/// A singleton class for managing application restarts.
///
/// This class provides methods to restart the application immediately
/// or schedule a restart after a specified duration.
class FlutterRestartApp {
  FlutterRestartApp._() {
    _initFuture = RustLib.init();
  }

  static final FlutterRestartApp instance = FlutterRestartApp._();

  late final Future<void> _initFuture;

  /// A smoke test function to verify the Rust library integration.
  ///
  /// This function is visible for testing purposes only and should not be used in production code.
  /// It returns a boolean value indicating whether the Rust function call was successful.
  ///
  /// Returns:
  ///   A boolean value, true if the smoke test passes, false otherwise.
  @visibleForTesting
  Future<bool> restartAppSmokeTest() async {
    await _initFuture;
    return restartAppSmokeTest();
  }

  /// Restarts the application immediately.
  ///
  /// This method ensures that the library is initialized before restarting.
  ///
  /// Example:
  /// ```dart
  /// await FlutterRestartApp.instance.now();
  /// ```
  ///
  /// After calling this method, the application will restart, and any unsaved state will be lost.
  Future<void> now() async {
    await _initFuture;
    restartApp();
  }

  /// Schedules a restart after the specified duration.
  ///
  /// This method ensures that the library is initialized before scheduling
  /// the restart. It uses a [Timer] to delay the restart operation.
  ///
  /// Parameters:
  ///   [duration] - The time to wait before restarting the application.
  ///
  /// Example:
  /// ```dart
  /// FlutterRestartApp.instance.scheduleRestart(Duration(seconds: 5));
  /// ```
  ///
  /// After the specified duration, the application will restart, and any unsaved state will be lost.
  /// Note that this method is non-blocking; it returns immediately after scheduling the restart.
  Future<void> scheduleRestart(Duration duration) async {
    await _initFuture;
    Timer(duration, restartApp);
  }
}
