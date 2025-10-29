import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healora/core/cache/hive_manager.dart';
import 'package:healora/core/theme/cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
    : super(
        HiveManager.getTheme()
            ? const DarkThemeState()
            : const LightThemeState(),
      );

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
