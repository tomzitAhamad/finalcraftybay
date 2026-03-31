import 'package:finalcrafty/features/auth/presentations/providers/sign_in_provider.dart';
import 'package:finalcrafty/features/auth/presentations/screens/sign_up_screen.dart';
import 'package:finalcrafty/features/shared/presentation/screens/main_nav_holder_screen.dart';
import 'package:finalcrafty/features/shared/widgets/center_circular_progress.dart';
import 'package:finalcrafty/features/shared/widgets/show_snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final SignInProvider _signInProvider = SignInProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _signInProvider,
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
                    SizedBox(height: 48),
                    AppLogo(),
                    SizedBox(height: 24),
                    Text('Welcome Back', style: context.textTheme.titleLarge),
                    Text(
                      'Sign In with your email and password',
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
                      controller: _passwordTeController,
                      decoration: InputDecoration(hintText: 'Password'),
                      validator: (String? value) =>
                          Validators.validatePassword(value),
                    ),
                    SizedBox(height: 16),
                    Consumer<SignInProvider>(
                      builder: (context, signInProvider, _) {
                        if (signInProvider.signInProgress) {
                          return CenterCircularProgress();
                        }
                        return FilledButton(
                          onPressed: _onTapSignInButton,
                          child: Text('Sign In'),
                        );
                      },
                    ),
                    SizedBox(height: 8),
                    TextButton(
                      onPressed: _onTapSignUpButton,
                      child: Text('Need an account? Sign up'),
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

  void _onTapSignInButton() async {
    if (_formKey.currentState!.validate()) {
      final bool isSuccess = await _signInProvider.signIn(
        _emailTeController.text.trim(),
        _passwordTeController.text,
      );
      if (isSuccess) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          MainNavHolderScreen.name,
          (_) => false,
        );
      } else {
        showSnackBarMessage(context, _signInProvider.errorMassage!);
      }
    }
  }

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
