import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:healora/core/cache/hive_manager.dart';
import 'package:healora/core/theme/cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const LightThemeState());

  void initTheme(BuildContext context) {
    final savedTheme = HiveManager.getTheme();

    if (savedTheme != null) {
      // User has previously saved preference
      emit(savedTheme ? const DarkThemeState() : const LightThemeState());
    } else {
      // Use system theme on first launch
      final brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      final isDark = brightness == Brightness.dark;
      emit(isDark ? const DarkThemeState() : const LightThemeState());
      HiveManager.saveTheme(isDark);
    }
  }

  void toggleTheme() {
    if (state is LightThemeState) {
      emit(const DarkThemeState());
      HiveManager.saveTheme(true);
    } else {
      emit(const LightThemeState());
      HiveManager.saveTheme(false);
    }
  }

  bool get isDark => state is DarkThemeState;
}
