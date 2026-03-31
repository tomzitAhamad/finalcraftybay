import 'package:finalcrafty/features/auth/data/models/sign_up_params.dart';
import 'package:finalcrafty/features/auth/presentations/providers/sign_up_provider.dart';
import 'package:finalcrafty/features/auth/presentations/screens/sign_in_screen.dart';
import 'package:finalcrafty/features/auth/presentations/screens/verify_otp_screen.dart';
import 'package:finalcrafty/features/shared/widgets/show_snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  SignUpProvider _signUpProvider = SignUpProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _signUpProvider,
      child: Scaffold(
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
                      controller: _emailTeController,
                      decoration: InputDecoration(hintText: 'Email'),
                      validator: (String? value) => Validators.validateEmail(
                        value,
                        'Valid Email is required',
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _firstNameTeController,
                      decoration: InputDecoration(hintText: 'First name'),
                      validator: (String? value) => Validators.validateText(
                        value,
                        'First name is required',
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _lastNameTeController,
                      decoration: InputDecoration(hintText: 'Last name'),
                      validator: (String? value) => Validators.validateText(
                        value,
                        'Last name is required',
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _phoneNumberTeController,
                      decoration: InputDecoration(hintText: 'Phone number'),
                      validator: (String? value) => Validators.validateText(
                        value,
                        'Phone number is required',
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _cityTeController,
                      decoration: InputDecoration(hintText: 'City'),
                      validator: (String? value) => Validators.validateText(
                        value,
                        'City name is required',
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _passwordTeController,
                      decoration: InputDecoration(hintText: 'Password'),
                      validator: (String? value) =>
                          Validators.validatePassword(value),
                    ),
                    SizedBox(height: 16),
                    Consumer<SignUpProvider>(
                      builder: (context, signUpProvider, _) {
                        if (signUpProvider.signUpInProgress) {
                          return CircularProgressIndicator();
                        }
                        return FilledButton(
                          onPressed: _onTapSignUpButton,
                          child: Text('Sign Up'),
                        );
                      },
                    ),
                    SizedBox(height: 8),
                    TextButton(
                      onPressed: _onTapSignInButton,
                      child: Text('Already have an account? Sign In'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton() {
    if (_formKey.currentState!.validate()) {
      _signUp();
    }
  }

  Future<void> _signUp() async {
    SignUpParams params = SignUpParams(
      firstName: _firstNameTeController.text.trim(),
      lastName: _lastNameTeController.text.trim(),
      email: _emailTeController.text.trim(),
      phone: _phoneNumberTeController.text.trim(),
      city: _cityTeController.text.trim(),
      password: _passwordTeController.text,
    );

    final bool isSuccess = await _signUpProvider.signUp(params);
    if (isSuccess) {
      Navigator.pushNamed(
        context,
        VerifyOtpScreen.name,
        arguments: _emailTeController.text.trim(),
      );
    } else {
      showSnackBarMessage(context, _signUpProvider.errorMassage!);
    }
  }

  void _onTapSignInButton() {
    Navigator.pushNamed(context, SignInScreen.name);
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
