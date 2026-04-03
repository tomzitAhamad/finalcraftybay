import 'dart:async';
import 'package:flutter/material.dart';

class OtpTimerProvider extends ChangeNotifier {

  int _secondsRemaining = 120;
  Timer? _timer;

  int get secondsRemaining => _secondsRemaining;

  bool get canResend => _secondsRemaining == 0;

  /// Start Timer
  void startTimer() {
    _secondsRemaining = 120;

    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        _secondsRemaining--;
        notifyListeners();
      }
    });
  }

  /// Resend OTP
  void resendCode() {
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}