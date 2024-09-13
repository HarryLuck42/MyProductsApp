import 'package:flutter/material.dart';

import '../core/constraint/sp_keys.dart';
import '../core/memory/shared/share_preference.dart';
import '../core/themes/app_theme.dart';

class AppProvider extends ChangeNotifier{
  ThemeData? _themeData;
  String? appVersion;

  ThemeData? get themeData => _themeData;

  set themeData(ThemeData? val) {
    _themeData = val;
    notifyListeners();
  }

  void setInitialTheme() {
    bool _themeState = SharedPreference().readStorage(SpKeys.isLightTheme) ?? true;
    _themeData = _themeState ? appLightTheme() : appDarkTheme();
  }
}