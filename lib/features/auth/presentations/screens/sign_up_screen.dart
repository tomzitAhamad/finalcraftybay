import 'package:finalcrafty/features/auth/presentations/screens/password_otp_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/extension/utils_extension.dart';
import '../../../shared/presentation/utils/validators.dart';
import '../widgets/app_logo.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTeController = TextEditingController();
  final TextEditingController _firstNameTeController = TextEditingController();
  final TextEditingController _lastNameTeController = TextEditingController();
  final TextEditingController _phoneNumberTeController =
      TextEditingController();
  final TextEditingController _cityTeController = TextEditingController();
  final TextEditingController _passwordTeController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  SizedBox(height: 24),
                  AppLogo(),
                  SizedBox(height: 24),
                  Text(
                    'Sign Up With Email',
                    style: context.textTheme.titleLarge,
                  ),
                  Text(
                    'Get started with your detail',
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Email'),
                    validator: (String? value) => Validators.validateEmail(
                      value,
                      'Valid Email is required',
                    ),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'First name'),
                    validator: (String? value) => Validators.validateText(
                      value,
                      'First name is required',
                    ),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Last name'),
                    validator: (String? value) =>
                        Validators.validateText(value, 'Last name is required'),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Phone number'),
                    validator: (String? value) => Validators.validateText(
                      value,
                      'Phone number is required',
                    ),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'City'),
                    validator: (String? value) =>
                        Validators.validateText(value, 'City name is required'),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Password'),
                    validator: (String? value) =>
                        Validators.validatePassword(value),
                  ),
                  SizedBox(height: 16),
                  FilledButton(
                    onPressed: _onTapSignUpButton,
                    child: Text('Sign Up'),
                  ),
                  SizedBox(height: 8,),
                  TextButton(onPressed: _onTapSignInButton, child: Text('Already have an account? Sign In'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, PasswordOtpScreen.name);
  }
  void _onTapSignInButton() {
    Navigator.pop(context);
  }
  @override
  void dispose() {
    _emailTeController.dispose();
    _firstNameTeController.dispose();
    _lastNameTeController.dispose();
    _phoneNumberTeController.dispose();
    _cityTeController.dispose();
    _passwordTeController.dispose();
    super.dispose();
  }
}
