import 'package:flutter/material.dart';
import 'package:flutter_aes/core/init/theme/app_theme.dart';
import 'package:flutter_aes/core/init/theme/theme.dart';

class LightTeheme extends AppTheme {
  static LightTeheme? _instance;
  static LightTeheme? get instance {
    _instance ??= LightTeheme._init();
    return null;
  }

  LightTeheme._init();
  @override
  ThemeData get theme => ThemeApp;
}
