import 'package:flutter/material.dart';
import 'package:flutter_aes/core/init/theme/app_theme.dart';
import 'package:flutter_aes/core/init/theme/theme.dart';

class FirstThemeApp extends AppTheme {
  static FirstThemeApp? _instance;
  static FirstThemeApp? get instance {
    _instance ??= FirstThemeApp._init();
    return null;
  }

  FirstThemeApp._init();
  @override
  ThemeData get theme => ThemeApp;
}
