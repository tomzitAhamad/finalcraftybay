import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../app/app_colors.dart';
import '../../../../app/extension/utils_extension.dart';
import '../providers/otp_timer_provider.dart';

class ResendOtpSection extends StatelessWidget {
  const ResendOtpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OtpTimerProvider>(
      builder: (context, otpProvider, child) {
        return Column(
          children: [
            Text.rich(
              TextSpan(
                text: "This code will expire in ",
                style: context.textTheme.bodyLarge?.copyWith(
                  color: Colors.grey,
                ),
                children: [
                  TextSpan(
                    text: "${otpProvider.secondsRemaining}s",
                    style: const TextStyle(
                      color: AppColors.themeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            GestureDetector(
              onTap: otpProvider.canResend
                  ? () => otpProvider.resendCode()
                  : null,
              child: Text(
                'Resend Code',
                style: context.textTheme.bodyLarge?.copyWith(
                  color: otpProvider.canResend
                      ? AppColors.themeColor
                      : Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}