import 'package:finalcrafty/features/auth/presentations/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/extension/utils_extension.dart';
import '../../../shared/presentation/utils/validators.dart';
import '../widgets/app_logo.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTeController = TextEditingController();
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
                  AppLogo(),
                  SizedBox(height: 24),
                  Text(
                    'Welcome Back',
                    style: context.textTheme.titleLarge,
                  ),
                  Text(
                    'Sign In with your email and password',
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
                    decoration: InputDecoration(hintText: 'Password'),
                    validator: (String? value) =>
                        Validators.validatePassword(value),
                  ),
                  SizedBox(height: 16),
                  FilledButton(
                    onPressed: _onTapSignInButton,
                    child: Text('Sign In'),
                  ),
                  SizedBox(height: 8),
                  TextButton(onPressed: _onTapSignUpButton, child: Text('Need an account? Sign up'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {}
  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }
  @override
  void dispose() {
    _emailTeController.dispose();
    _passwordTeController.dispose();
    super.dispose();
  }
}
