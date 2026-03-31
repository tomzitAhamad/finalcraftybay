import 'package:finalcrafty/app/app_colors.dart';
import 'package:finalcrafty/features/auth/presentations/providers/verify_otp_provider.dart';
import 'package:finalcrafty/features/auth/presentations/widgets/resend_otp_section.dart';
import 'package:finalcrafty/features/shared/presentation/screens/main_nav_holder_screen.dart';
import 'package:finalcrafty/features/shared/widgets/center_circular_progress.dart';
import 'package:finalcrafty/features/shared/widgets/show_snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../../../app/extension/utils_extension.dart';
import '../providers/otp_timer_provider.dart';
import '../widgets/app_logo.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});
  static const String name = '/password-otp';
  final String email;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  final VerifyOtpProvider _verifyOtpProvider = VerifyOtpProvider();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<OtpTimerProvider>().startTimer();
    });
  }

  /// NEXT BUTTON
  void _onTapVerifyButton() async {
    if (_formKey.currentState!.validate()) {
      bool isSuccess = await _verifyOtpProvider.verifyOtp(
        widget.email,
        _otpController.text,
      );

      if (isSuccess) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          MainNavHolderScreen.name,
          (_) => false,
        );
      } else {
        showSnackBarMessage(
          context,
          _verifyOtpProvider.errorMassage ?? "Verification failed",
        );
      }
    } else {
      showSnackBarMessage(context, "Enter valid OTP");
    }
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

    return ChangeNotifierProvider.value(
      value: _verifyOtpProvider,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 70),

                  const AppLogo(),

                  const SizedBox(height: 24),

                  Text('Enter OTP Code', style: context.textTheme.titleLarge),

                  Text(
                    'A 4 digits OTP code has been sent',
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// OTP FIELD
                  Form(
                    key: _formKey,
                    child: Pinput(
                      length: 4,
                      controller: _otpController,
                      keyboardType: TextInputType.number,
                      defaultPinTheme: defaultPinTheme,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter OTP";
                        }
                        if (value.length < 4) {
                          return "OTP must be 4 digits";
                        }
                        return null;
                      },
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// TIMER + RESEND (Consumer)
                  const ResendOtpSection(),

                  const SizedBox(height: 24),

                  /// NEXT BUTTON
                  Consumer<VerifyOtpProvider>(
                    builder: (context, verifyOtpProvider, _) {
                      if (verifyOtpProvider.verifyOtpInProgress) {
                        return CenterCircularProgress();
                      }
                      return SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: _onTapVerifyButton,
                          child: const Text('Next'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
