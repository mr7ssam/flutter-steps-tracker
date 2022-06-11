import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../storage.dart';

const _themeModeKey = '__theme_mode__';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider(this.storageService) {
    _init();
  }

  final IStorageService storageService;

  String? _themeString;

  void _init() {
    _theme = storageService.getString(_themeModeKey);
  }

  set _theme(String? theme) {
    _themeString = theme;
    notifyListeners();
  }

  ThemeMode get themeMode {
    switch (_themeString) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  Brightness get _platformBrightness =>
      MediaQueryData.fromWindow(WidgetsBinding.instance.window)
          .platformBrightness;

  void toggleTheme() {
    late Brightness brightness;
    // default mode, ask platform
    if (_themeString == null) {
      brightness = _platformBrightness;
    } else {
      brightness = _themeString!.themeBrightness;
    }
    _theme = brightness.name.oppositeThemeBrightness;
    _saveTheme(_themeString!);
  }

  Future<void> _saveTheme(String value) async {
    await storageService.setString(_themeModeKey, value);
  }

  static ThemeProvider of(BuildContext context) {
    return context.read<ThemeProvider>();
  }
}

extension _StringThemeExt on String {
  Brightness get themeBrightness {
    switch (this) {
      case 'dark':
        return Brightness.dark;
      default:
        return Brightness.light;
    }
  }

  String get oppositeThemeBrightness {
    switch (this) {
      case 'dark':
        return 'light';
      default:
        return 'dark';
    }
  }
}
