import 'package:finalcrafty/app/app_colors.dart';
import 'package:finalcrafty/features/auth/presentations/widgets/resend_otp_section.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../../../app/extension/utils_extension.dart';
import '../providers/otp_timer_provider.dart';
import '../widgets/app_logo.dart';

class PasswordOtpScreen extends StatefulWidget {
  const PasswordOtpScreen({super.key});
  static const String name = '/password-otp';

  @override
  State<PasswordOtpScreen> createState() => _PasswordOtpScreenState();
}

class _PasswordOtpScreenState extends State<PasswordOtpScreen> {

  final TextEditingController _otpController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<OtpTimerProvider>().startTimer();
    });
  }

  /// NEXT BUTTON
  void _onTapSignUpButton() {
    String otp = _otpController.text;
    print("OTP: $otp");
  }

  @override
  void dispose() {
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

                const SizedBox(height: 70),

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
                ),

                const SizedBox(height: 24),

                /// TIMER + RESEND (Consumer)
                const ResendOtpSection(),

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