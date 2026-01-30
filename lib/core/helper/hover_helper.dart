import 'dart:async';
import 'package:flutter/material.dart';

class HoverNavigator {
  Timer? _timer;

  void start({
    required Duration delay,
    required VoidCallback onComplete,
  }) {
    _timer?.cancel();
    _timer = Timer(delay, onComplete);
  }

  void cancel() {
    _timer?.cancel();
  }

  void dispose() {
    _timer?.cancel();
  }
}
