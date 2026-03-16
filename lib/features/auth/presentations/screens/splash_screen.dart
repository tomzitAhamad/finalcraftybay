
import 'package:flutter/material.dart';
import '../../../shared/presentation/screens/main_nav_holder_screen.dart';
import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name='/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen()async{
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, MainNavHolderScreen.name);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      body: Column(
        children: [

            Spacer(),
            Center(child: AppLogo(height: 120,)),
            Spacer(),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}


