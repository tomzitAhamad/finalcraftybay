import 'dart:async';
import 'package:finalcrafty/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../../../app/extension/utils_extension.dart';
import '../widgets/app_logo.dart';

class PasswordOtpScreen extends StatefulWidget {
  const PasswordOtpScreen({super.key});
  static const String name = '/password-otp';

  @override
  State<PasswordOtpScreen> createState() => _PasswordOtpScreenState();
}

class _PasswordOtpScreenState extends State<PasswordOtpScreen> {

  final TextEditingController _otpController = TextEditingController();

  int _secondsRemaining = 120;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  /// START TIMER
  void _startTimer() {
    _secondsRemaining = 120;

    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  /// RESEND OTP
  void _onTapResendCode() {
    _startTimer();
    print("OTP Resent");
  }

  /// NEXT BUTTON
  void _onTapSignUpButton() {
    String otp = _otpController.text;
    print("OTP: $otp");
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: context.textTheme.titleLarge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.themeColor),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 70,),
                const AppLogo(),

                const SizedBox(height: 24),

                Text(
                  'Enter OTP Code',
                  style: context.textTheme.titleLarge,
                ),

                Text(
                  'A 4 digits OTP code has been sent',
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 24),

                /// OTP FIELD
                Pinput(
                  length: 4,
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  defaultPinTheme: defaultPinTheme,
                  onCompleted: (pin) {
                    print('Entered OTP: $pin');
                  },
                ),

                const SizedBox(height: 24),

                /// TIMER TEXT
                Text.rich(
                  TextSpan(
                    text: "This code will expire in ",
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                    ),
                    children: [
                      TextSpan(
                        text: "${_secondsRemaining}s",
                        style: const TextStyle(
                          color: AppColors.themeColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                /// RESEND CODE
                GestureDetector(
                  onTap: _secondsRemaining == 0 ? _onTapResendCode : null,
                  child: Text(
                    'Resend Code',
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: _secondsRemaining == 0
                          ? AppColors.themeColor
                          : Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                /// NEXT BUTTON
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _onTapSignUpButton,
                    child: const Text('Next'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}