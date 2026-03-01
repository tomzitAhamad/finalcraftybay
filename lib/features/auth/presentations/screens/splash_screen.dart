import 'package:finalcrafty/app/extension/localization_extension.dart';
import 'package:finalcrafty/app/provider/language_provider.dart';
import 'package:finalcrafty/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final language=context.read<LanguageProvider>();
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.hello),),
      body: Column(
        children: [
          Text(context.l10n.changeYourLanguage),
          FilledButton(onPressed: (){
            Locale locale= language.currentLocale;
            if(locale==Locale('en')){
              language.changeLocale(Locale('bn'));
            }else{
              language.changeLocale(Locale('en'));
            }
          }, child: Text('Change'))
        ],
      ),
    );
  }
}
