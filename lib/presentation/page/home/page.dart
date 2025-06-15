import 'package:currency_converter/l10n/app_localizations.dart';
import 'package:currency_converter/utils/constants/constants_base.dart';
import 'package:currency_converter/utils/constants/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class ChangeLanguageDialog extends StatelessWidget {
  const ChangeLanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AlertDialog(
        backgroundColor: colorController.themeData.value.colorScheme.primary,
        title: Text(
          AppLocalizations.of(context)!.changeLanguage,
          style: colorController.themeData.value.textTheme.headlineMedium
              ?.copyWith(
                color: colorController.themeData.value.colorScheme.onPrimary,
                fontSize: ThemeConstants.titleFontSize.sp,
              ),
        ),
        content: Container(
          height: 45.h,
          width: 80.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ThemeConstants.cardRadius.sp),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (String language in supportedLanguages..sort())
                  ListTile(
                    leading: SizedBox(
                      width: ThemeConstants.buttonFontSize.sp,
                      child: Image.asset(
                        'assets/images/$language.png',
                        fit: BoxFit.fitWidth,
                        // filterQuality: FilterQuality.high,
                      ),
                    ),
                    title: Text(
                      language,
                      style: colorController.themeData.value.textTheme.bodyLarge
                          ?.copyWith(
                            color:
                                colorController
                                    .themeData
                                    .value
                                    .colorScheme
                                    .onPrimary,
                            fontSize: ThemeConstants.buttonFontSize.sp,
                          ),
                    ),
                    trailing:
                        languageAndFormatController.selectedLanguage.value ==
                                language
                            ? Icon(
                              Icons.check,
                              color:
                                  colorController
                                      .themeData
                                      .value
                                      .colorScheme
                                      .onPrimary,
                            )
                            : Text(
                              '(${supportedLanguageNames(language)})',
                              style: colorController
                                  .themeData
                                  .value
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color:
                                        colorController
                                            .themeData
                                            .value
                                            .colorScheme
                                            .onPrimary,
                                    fontWeight: FontWeight.w200,
                                    fontSize: ThemeConstants.defaultFontSize.sp,
                                  ),
                            ),
                    onTap: () {
                      languageAndFormatController.changeLanguage(language);
                      switch (language) {
                        case 'English':
                          Get.updateLocale(Locale('en'));
                          break;
                        case 'Español':
                          Get.updateLocale(Locale('es'));
                          break;
                        case 'Français':
                          Get.updateLocale(Locale('fr'));
                          break;
                        case 'Deutsch':
                          Get.updateLocale(Locale('de'));
                          break;
                        case 'Italiano':
                          Get.updateLocale(Locale('it'));
                          break;
                        case 'Português':
                          Get.updateLocale(Locale('pt'));
                          break;
                        case 'Русский':
                          Get.updateLocale(Locale('ru'));
                          break;
                        case '中文':
                          Get.updateLocale(Locale('zh'));
                          break;
                        case '日本語':
                          Get.updateLocale(Locale('ja'));
                          break;
                        case 'हिंदी':
                          Get.updateLocale(Locale('hi'));
                          break;
                        case 'తెలుగు':
                          Get.updateLocale(Locale('te'));
                          break;
                        case 'தமிழ்':
                          Get.updateLocale(Locale('ta'));
                          break;
                        case 'മലയാളം':
                          Get.updateLocale(Locale('ml'));
                          break;
                        case 'ಕನ್ನಡ':
                          Get.updateLocale(Locale('kn'));
                          break;
                        case 'العربية':
                          Get.updateLocale(Locale('ar'));
                          break;
                        case 'Nederlands':
                          Get.updateLocale(Locale('nl'));
                          break;
                        case 'Ελληνικά':
                          Get.updateLocale(Locale('el'));
                          break;
                        case 'Bahasa Indonesia':
                          Get.updateLocale(Locale('id'));
                          break;
                        case '한국어':
                          Get.updateLocale(Locale('ko'));
                          break;
                        case 'Polski':
                          Get.updateLocale(Locale('pl'));
                          break;
                        case 'Română':
                          Get.updateLocale(Locale('ro'));
                          break;
                        case 'Türkçe':
                          Get.updateLocale(Locale('tr'));
                          break;
                        default:
                          Get.updateLocale(Locale('en'));
                      }
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              size: ThemeConstants.iconSize.sp,
              color: colorController.themeData.value.colorScheme.onPrimary,
            ),
            onPressed: () {
              Get.bottomSheet(
                Obx(
                  () => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.all(ThemeConstants.padding.sp),
                    height: 50.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color:
                          colorController.themeData.value.colorScheme.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(ThemeConstants.cardRadius.sp),
                        topRight: Radius.circular(ThemeConstants.cardRadius.sp),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.color_lens_rounded,
                            color:
                                colorController
                                    .themeData
                                    .value
                                    .colorScheme
                                    .onPrimary,
                            size: ThemeConstants.iconSize.sp,
                          ),
                          title: Text(
                            AppLocalizations.of(context)!.changeThemeColor,
                            style: colorController
                                .themeData
                                .value
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  color:
                                      colorController
                                          .themeData
                                          .value
                                          .colorScheme
                                          .onPrimary,
                                  fontSize: ThemeConstants.buttonFontSize.sp,
                                ),
                          ),
                          trailing: CircleAvatar(
                            backgroundColor: colorController.seedColor.value,
                            radius: ThemeConstants.buttonFontSize.sp,
                          ),
                          onTap: () {
                            Get.dialog(
                              Obx(
                                () => AlertDialog(
                                  backgroundColor:
                                      colorController
                                          .themeData
                                          .value
                                          .colorScheme
                                          .primary,
                                  title: Text(
                                    AppLocalizations.of(
                                      context,
                                    )!.changeThemeColor,
                                    style: colorController
                                        .themeData
                                        .value
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                          color:
                                              colorController
                                                  .themeData
                                                  .value
                                                  .colorScheme
                                                  .onPrimary,
                                          fontSize:
                                              ThemeConstants.titleFontSize.sp,
                                        ),
                                  ),
                                  content: SingleChildScrollView(
                                    child: ColorPicker(
                                      displayThumbColor: true,
                                      enableAlpha: false,
                                      paletteType: PaletteType.rgbWithBlue,
                                      pickerAreaBorderRadius:
                                          BorderRadius.circular(
                                            ThemeConstants.cardRadius.sp,
                                          ),
                                      pickerColor:
                                          colorController.seedColor.value,
                                      onColorChanged: (color) {
                                        colorController.changeSeedColor(color);
                                      },
                                      hexInputBar: false,
                                      portraitOnly: true,
                                      labelTypes: [],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.brightness_6_rounded,
                            color:
                                colorController
                                    .themeData
                                    .value
                                    .colorScheme
                                    .onPrimary,
                            size: ThemeConstants.iconSize.sp,
                          ),
                          title: Text(
                            AppLocalizations.of(context)!.changeThemeMode(
                              colorController.themeMode.value == ThemeMode.dark
                                  ? 'light'
                                  : colorController.themeMode.value ==
                                      ThemeMode.light
                                  ? 'dark'
                                  : 'system',
                            ),
                            style: colorController
                                .themeData
                                .value
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  color:
                                      colorController
                                          .themeData
                                          .value
                                          .colorScheme
                                          .onPrimary,
                                  fontSize: ThemeConstants.buttonFontSize.sp,
                                ),
                          ),
                          trailing: Icon(
                            colorController.themeMode.value == ThemeMode.dark
                                ? Icons.wb_sunny_rounded
                                : colorController.themeMode.value ==
                                    ThemeMode.light
                                ? Icons.nightlight_round_rounded
                                : Icons.brightness_auto_rounded,
                            size: ThemeConstants.iconSize.sp,
                            color:
                                colorController
                                    .themeData
                                    .value
                                    .colorScheme
                                    .onPrimary,
                          ),
                          onTap: () {
                            colorController.changeBrightness();
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.dialog(ChangeLanguageDialog());
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  leading: Icon(
                                    Icons.language_rounded,
                                    color:
                                        colorController
                                            .themeData
                                            .value
                                            .colorScheme
                                            .onPrimary,
                                    size: ThemeConstants.iconSize.sp,
                                  ),
                                  title: Text(
                                    AppLocalizations.of(
                                      context,
                                    )!.changeLanguage,
                                    style: colorController
                                        .themeData
                                        .value
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color:
                                              colorController
                                                  .themeData
                                                  .value
                                                  .colorScheme
                                                  .onPrimary,
                                          fontSize:
                                              ThemeConstants.buttonFontSize.sp,
                                        ),
                                  ),
                                  onTap: () {
                                    Get.dialog(ChangeLanguageDialog());
                                  },
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.dialog(ChangeLanguageDialog());
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.language,
                                      style: colorController
                                          .themeData
                                          .value
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color:
                                                colorController
                                                    .themeData
                                                    .value
                                                    .colorScheme
                                                    .onPrimary,
                                            fontSize:
                                                ThemeConstants
                                                    .buttonFontSize
                                                    .sp,
                                          ),
                                    ),
                                    SizedBox(width: 8.sp),
                                    SizedBox(
                                      height: ThemeConstants.buttonFontSize.sp,
                                      child: Image.asset(
                                        'assets/images/${AppLocalizations.of(context)!.language}.png',
                                        fit: BoxFit.fitHeight,
                                        // filterQuality: FilterQuality.high,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          backgroundColor: colorController.themeData.value.colorScheme.primary,
          title: Text(
            AppLocalizations.of(context)!.helloWorld,
            style: colorController.themeData.value.textTheme.headlineMedium
                ?.copyWith(
                  color: colorController.themeData.value.colorScheme.onPrimary,
                ),
          ),
        ),
        backgroundColor:
            colorController.themeData.value.colorScheme.primaryContainer,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                NumberFormat.simpleCurrency(
                  name: '',
                  locale: supportedLanguageCodes(
                    languageAndFormatController.selectedLanguage.value,
                  ),
                ).format(15645465.4564),
                style: colorController.themeData.value.textTheme.headlineMedium
                    ?.copyWith(
                      color:
                          colorController
                              .themeData
                              .value
                              .colorScheme
                              .onPrimaryContainer,
                      fontSize: ThemeConstants.titleFontSize.sp,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
