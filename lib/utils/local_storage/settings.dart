import 'dart:ui';
import 'package:hive/hive.dart';

class Settings {
  static const String _settingsKey = 'settings';

  static const String _languageKey = 'language';
  static const String _themeColorKey = 'themeColor';
  static const String _themeModeKey = 'themeMode';

  Future<void> saveLanguage(String language) async {
    final box = await Hive.openBox(_settingsKey);
    await box.put(_languageKey, language);
  }

  String getLanguage() {
    final box = Hive.box(_settingsKey);
    return box.get(_languageKey, defaultValue: 'English');
  }

  Future<void> saveThemeColor(Color color) async {
    final box = await Hive.openBox(_settingsKey);
    await box.put(_themeColorKey, [
      color.a * 255,
      color.r * 255,
      color.g * 255,
      color.b * 255,
    ]);
  }

  Color getThemeColor() {
    final box = Hive.box(_settingsKey);
    List<double> values = box.get(
      _themeColorKey,
      defaultValue: [255.0, 33.0, 131.0, 144.0],
    );
    return Color.fromARGB(
      (values[0]).floor(),
      (values[1]).floor(),
      (values[2]).floor(),
      (values[3]).floor(),
    );
  }

  Future<void> saveThemeMode(Brightness themeMode) async {
    final box = await Hive.openBox(_settingsKey);
    await box.put(
      _themeModeKey,
      themeMode == Brightness.dark ? 'dark' : 'light',
    );
  }

  Brightness getThemeMode() {
    final box = Hive.box(_settingsKey);
    String mode = box.get(_themeModeKey, defaultValue: 'light');
    return mode == 'dark' ? Brightness.dark : Brightness.light;
  }

  Future<void> init() async {
    await Hive.openBox(_settingsKey);
  }
}
