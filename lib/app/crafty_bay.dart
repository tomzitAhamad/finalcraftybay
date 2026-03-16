
import 'package:finalcrafty/app/app_routes.dart';
import 'package:finalcrafty/app/app_theme.dart';
import 'package:finalcrafty/app/provider/language_provider.dart';
import 'package:finalcrafty/app/provider/theme_provider.dart';
import 'package:finalcrafty/features/shared/presentation/providers/main_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../features/auth/presentations/providers/otp_timer_provider.dart';
import '../l10n/app_localizations.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (context)=> LanguageProvider()),
        ChangeNotifierProvider(create: (context)=>ThemeProvider()),
        ChangeNotifierProvider(create: (context)=>OtpTimerProvider()),
        ChangeNotifierProvider(create: (context)=>MainNavProvider())
      ],
      child: Consumer2<LanguageProvider,ThemeProvider>(
        builder: (context,languageProvider,themeProvider,child) {
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
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode
          );
        }
      ),
    );
  }
}
