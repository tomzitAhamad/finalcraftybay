
import 'package:finalcrafty/app/app_routes.dart';
import 'package:finalcrafty/app/app_theme.dart';
import 'package:finalcrafty/app/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (context)=> LanguageProvider())
      ],
      child: Consumer<LanguageProvider>(
        builder: (context,languageProvider,child) {
          return MaterialApp(
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: languageProvider.currentLocale,
            supportedLocales: [
              Locale('en'),
              Locale('bn')
            ],
            initialRoute: '/',
            onGenerateRoute: AppRoutes.onGenerateRoute,
            theme: AppTheme.lighttheme,
            darkTheme: AppTheme.darktheme,
          );
        }
      ),
    );
  }
}
