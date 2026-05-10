import 'dart:async';
import 'package:flutter/material.dart';

/// An expando to store debounce timers per controller instance
final Expando<Timer> _debounceMap = Expando<Timer>();

extension DebounceTextController on TextEditingController {
  /// Debounce listener
  void debounce({
    required VoidCallback onDebounce,
    Duration delay = const Duration(milliseconds: 500),
  }) {
    addListener(() {
      // Cancel previous timer (if any)
      _debounceMap[this]?.cancel();

      // Create a new timer for this controller
      _debounceMap[this] = Timer(delay, onDebounce);
    });
  }

  /// Cancel the debounce manually
  void cancelDebounce() {
    _debounceMap[this]?.cancel();
    _debounceMap[this] = null;
  }

  /// MUST be called when disposing controller
  void disposeDebounce() {
    _debounceMap[this]?.cancel();
    _debounceMap[this] = null;
  }
}
