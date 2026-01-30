// File: lib/core/helpers.dart
import 'dart:async';
import 'package:battery_plus/battery_plus.dart';

/// ========================= Time Formatter =========================
String formatTime(DateTime time) {
  int hour = time.hour;
  final minute = time.minute.toString().padLeft(2, '0');
  final isPM = hour >= 12;

  if (hour == 0) {
    hour = 12;
  } else if (hour > 12) {
    hour -= 12;
  }

  return "$hour:$minute ${isPM ? 'PM' : 'AM'}";
}

/// ========================= Battery Helper =========================
Future<int> getBatteryLevel(Battery battery) async {
  final level = await battery.batteryLevel;
  return level;
}

/// ========================= Timer Helper =========================
Timer startTimeUpdater(void Function() updateCallback) {
  return Timer.periodic(const Duration(seconds: 1), (timer) {
    updateCallback();
  });
}
