import 'package:currency_converter/utils/constants/constants_base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorController extends GetxController {
  late Rx<Color> seedColor;
  late Rx<ThemeData> themeData;
  late Rx<ThemeMode> themeMode;
  @override
  void onInit() {
    super.onInit();
    seedColor = settings.getThemeColor().obs;
    themeMode =
        settings.getThemeMode() == Brightness.dark
            ? ThemeMode.dark.obs
            : ThemeMode.light.obs;
    themeData =
        ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor.value,
            brightness:
                themeMode.value == ThemeMode.dark
                    ? Brightness.dark
                    : Brightness.light,
          ),
          textTheme: GoogleFonts.montserratTextTheme(),
        ).obs;
    Get.changeTheme(themeData.value);
    Get.changeThemeMode(themeMode.value);
  }

  void changeSeedColor(Color newColor) {
    seedColor.value = newColor;
    final isDark = themeMode.value == ThemeMode.dark;
    themeData.value = ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: newColor,
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),
    );
    Get.changeTheme(themeData.value);
    Get.changeThemeMode(themeMode.value);
    settings.saveThemeColor(newColor);
    settings.saveThemeMode(isDark ? Brightness.dark : Brightness.light);
  }

  void changeBrightness() {
    themeMode.value =
        themeMode.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    final isDark = themeMode.value == ThemeMode.dark;
    themeData.value = ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor.value,
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),
    );
    Get.changeTheme(themeData.value);
    Get.changeThemeMode(themeMode.value);
    settings.saveThemeMode(isDark ? Brightness.dark : Brightness.light);
    settings.saveThemeColor(seedColor.value);
  }
}
