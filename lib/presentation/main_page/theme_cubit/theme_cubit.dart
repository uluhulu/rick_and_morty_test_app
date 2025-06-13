import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test_app/domain/repositories/theme_repository.dart';
import 'package:rick_and_morty_test_app/presentation/main_page/theme_cubit/theme_state.dart';
import 'package:rick_and_morty_test_app/utils/themes.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final ThemeRepository repository;

  ThemeCubit(this.repository)
    : super(ThemeState(themeMode: ThemeMode.light, themeData: lightTheme));

  Future<void> loadTheme() async {
    final savedMode = await repository.loadThemeMode();
    final savedTheme = savedMode == ThemeMode.light ? lightTheme : darkTheme;
    emit(ThemeState(themeMode: savedMode, themeData: savedTheme));
  }

  Future<void> toggleTheme() async {
    final newMode =
        state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    final newTheme = newMode == ThemeMode.light ? lightTheme : darkTheme;
    await repository.saveThemeMode(newMode);
    emit(ThemeState(themeMode: newMode, themeData: newTheme));
  }

  Future<void> setTheme(ThemeMode mode) async {
    await repository.saveThemeMode(mode);
    emit(ThemeState(themeMode: mode, themeData: state.themeData));
  }
}
