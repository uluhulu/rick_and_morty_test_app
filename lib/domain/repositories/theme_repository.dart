import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:rick_and_morty_test_app/utils/strings.dart';

class ThemeRepository {
  Future<void> saveThemeMode(ThemeMode mode) async {
    final box = await Hive.openBox(boxName);
    await box.put(key, mode.name); // name = 'light', 'dark', etc.
  }

  Future<ThemeMode> loadThemeMode() async {
    final box = await Hive.openBox(boxName);
    final value = box.get(key) as String?;

    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
