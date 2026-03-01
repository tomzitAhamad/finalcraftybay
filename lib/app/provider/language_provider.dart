import 'package:flutter/cupertino.dart';

class LanguageProvider extends ChangeNotifier{
  Locale _currentLocale=Locale('en');
  Locale get currentLocale=> _currentLocale;
  void changeLocale(Locale locale){
    _currentLocale=locale;
    notifyListeners();
  }
}