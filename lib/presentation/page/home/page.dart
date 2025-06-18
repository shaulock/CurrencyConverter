import 'package:currency_converter/l10n/app_localizations.dart';
import 'package:currency_converter/utils/constants/constants_base.dart';
import 'package:currency_converter/utils/constants/theme_constants.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ChangeLanguageDialog extends StatelessWidget {
  const ChangeLanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedLanguage =
        languageAndFormatController.selectedLanguage.value;
    supportedLanguages = [
      selectedLanguage,
      ...supportedLanguages
        ..sort()
        ..remove(selectedLanguage),
    ];
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
                for (String language in supportedLanguages)
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
                      Get.back();
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

  String makeConvertedAmount() {
    return (conversionController.toCurrency.value.symbolOnLeft
            ? conversionController.toCurrency.value.symbol
            : '') +
        (conversionController.toCurrency.value.spaceBetweenAmountAndSymbol &&
                conversionController.toCurrency.value.symbolOnLeft
            ? ' '
            : '') +
        conversionController.toAmountDouble.toStringAsFixed(2) +
        (conversionController.toCurrency.value.spaceBetweenAmountAndSymbol &&
                !conversionController.toCurrency.value.symbolOnLeft
            ? ' '
            : '') +
        (conversionController.toCurrency.value.symbolOnLeft
            ? ''
            : conversionController.toCurrency.value.symbol);
  }

  String makeAmount() {
    return (conversionController.fromCurrency.value.symbolOnLeft
            ? conversionController.fromCurrency.value.symbol
            : '') +
        (conversionController.fromCurrency.value.spaceBetweenAmountAndSymbol &&
                conversionController.fromCurrency.value.symbolOnLeft
            ? ' '
            : '') +
        conversionController.fromAmountDouble.toStringAsFixed(2) +
        (conversionController.fromCurrency.value.spaceBetweenAmountAndSymbol &&
                !conversionController.fromCurrency.value.symbolOnLeft
            ? ' '
            : '') +
        (conversionController.fromCurrency.value.symbolOnLeft
            ? ''
            : conversionController.fromCurrency.value.symbol);
  }

  selectFromCurrency(BuildContext context) {
    showCurrencyPicker(
      context: context,
      onSelect: (currency) async {
        await conversionController.setFromCurrency(currency);
      },
      theme: CurrencyPickerThemeData(
        backgroundColor:
            colorController.themeData.value.colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.cardRadius.sp),
        ),
        subtitleTextStyle: colorController.themeData.value.textTheme.bodyLarge
            ?.copyWith(
              color:
                  colorController
                      .themeData
                      .value
                      .colorScheme
                      .onPrimaryContainer,
              fontSize: ThemeConstants.buttonFontSize.sp,
            ),
        currencySignTextStyle: colorController
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
                      .onPrimaryContainer,
              fontSize: ThemeConstants.buttonFontSize.sp,
            ),
        flagSize: ThemeConstants.iconSize.sp,
        inputDecoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search_rounded,
            color: colorController.themeData.value.colorScheme.primaryContainer,
          ),
          filled: true,
          fillColor: colorController.themeData.value.colorScheme.primary
              .withValues(alpha: 0.7),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ThemeConstants.cardRadius.sp),
            borderSide: BorderSide(
              color: colorController.themeData.value.colorScheme.primary,
            ),
          ),
        ),
        bottomSheetHeight: 60.h,
        titleTextStyle: colorController.themeData.value.textTheme.headlineMedium
            ?.copyWith(
              color:
                  colorController
                      .themeData
                      .value
                      .colorScheme
                      .onPrimaryContainer,
              fontSize: ThemeConstants.subtitleFontSize.sp,
            ),
      ),
      showFlag: true,
      showSearchField: true,
      showCurrencyCode: true,
      showCurrencyName: true,
      currencyFilter: supportedCurrencies.toSet().toList(),
    );
  }

  selectToCurrency(BuildContext context) {
    showCurrencyPicker(
      context: context,
      onSelect: (currency) async {
        await conversionController.setToCurrency(currency);
      },
      theme: CurrencyPickerThemeData(
        backgroundColor:
            colorController.themeData.value.colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.cardRadius.sp),
        ),
        subtitleTextStyle: colorController.themeData.value.textTheme.bodyLarge
            ?.copyWith(
              color:
                  colorController
                      .themeData
                      .value
                      .colorScheme
                      .onPrimaryContainer,
              fontSize: ThemeConstants.buttonFontSize.sp,
            ),
        currencySignTextStyle: colorController
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
                      .onPrimaryContainer,
              fontSize: ThemeConstants.buttonFontSize.sp,
            ),
        flagSize: ThemeConstants.iconSize.sp,
        inputDecoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search_rounded,
            color: colorController.themeData.value.colorScheme.primaryContainer,
          ),
          filled: true,
          fillColor: colorController.themeData.value.colorScheme.primary
              .withValues(alpha: 0.7),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ThemeConstants.cardRadius.sp),
            borderSide: BorderSide(
              color: colorController.themeData.value.colorScheme.primary,
            ),
          ),
        ),
        bottomSheetHeight: 60.h,
        titleTextStyle: colorController.themeData.value.textTheme.headlineMedium
            ?.copyWith(
              color:
                  colorController
                      .themeData
                      .value
                      .colorScheme
                      .onPrimaryContainer,
              fontSize: ThemeConstants.subtitleFontSize.sp,
            ),
      ),
      showFlag: true,
      showSearchField: true,
      showCurrencyCode: true,
      showCurrencyName: true,
      currencyFilter: supportedCurrencies.toSet().toList(),
    );
  }

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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.5.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 3.h),
              ListTile(
                leading: IconButton(
                  onPressed: () {
                    selectFromCurrency(context);
                  },
                  style: IconButton.styleFrom(padding: EdgeInsets.zero),
                  icon: Container(
                    width: 25.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: ThemeConstants.padding.sp,
                      vertical: ThemeConstants.padding.sp / 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorController.themeData.value.colorScheme.primary
                          .withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(
                        ThemeConstants.cardRadius.sp,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: colorController.themeData.value.shadowColor
                              .withValues(alpha: 0.2),
                          blurRadius: 5.sp,
                          spreadRadius: 1.sp,
                          offset: Offset(0, 5.sp),
                        ),
                      ],
                    ),
                    child: Text(
                      '${conversionController.fromCurrency.value.code} ${conversionController.fromCurrency.value.flag != null ? CurrencyUtils.currencyToEmoji(conversionController.fromCurrency.value) : conversionController.fromCurrency.value.flag}',
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
                                    .onPrimaryContainer,
                            fontSize: ThemeConstants.buttonFontSize.sp,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                title: GestureDetector(
                  onTap: () {
                    if (conversionController.isLoading.value) return;
                    Get.bottomSheet(
                      Container(
                        height: 40.h,
                        width: 100.w,
                        color:
                            colorController.themeData.value.colorScheme.primary,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            for (int i = 0; i <= 3; i++)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  for (int j = 0; j < 3; j++)
                                    !(i == 3 && j == 0)
                                        ? SizedBox(
                                          height: 5.h,
                                          width: 10.w,
                                          child: TextButton(
                                            onPressed: () {
                                              if (i < 3) {
                                                conversionController
                                                        .fromAmount
                                                        .value =
                                                    conversionController
                                                            .fromAmount
                                                            .value *
                                                        10 +
                                                    (((i) * 3) + j + 1);
                                              } else {
                                                if (j == 1) {
                                                  conversionController
                                                          .fromAmount
                                                          .value =
                                                      conversionController
                                                              .fromAmount
                                                              .value *
                                                          10 +
                                                      0;
                                                } else {
                                                  conversionController
                                                          .fromAmount
                                                          .value =
                                                      (conversionController
                                                                  .fromAmount
                                                                  .value /
                                                              10)
                                                          .floorToDouble();
                                                }
                                              }
                                              conversionController
                                                  .toAmount
                                                  .value = conversionController
                                                      .fromAmount
                                                      .value *
                                                  conversionController
                                                      .rate
                                                      .value;
                                            },
                                            style: TextButton.styleFrom(
                                              backgroundColor: colorController
                                                  .themeData
                                                  .value
                                                  .colorScheme
                                                  .primaryContainer
                                                  .withValues(alpha: 0.2),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      ThemeConstants
                                                          .cardRadius
                                                          .sp,
                                                    ),
                                              ),
                                              padding: EdgeInsets.zero,
                                            ),
                                            child: Text(
                                              i < 3
                                                  ? '${(i) * 3 + (j + 1)}'
                                                  : (j == 1 ? '0' : '←'),
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
                                                        ThemeConstants
                                                            .subtitleFontSize
                                                            .sp,
                                                  ),
                                            ),
                                          ),
                                        )
                                        : SizedBox(height: 5.h, width: 10.w),
                                ],
                              ),
                          ],
                        ),
                      ),
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      barrierColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      isDismissible: true,
                      enterBottomSheetDuration: Duration(milliseconds: 150),
                      exitBottomSheetDuration: Duration(milliseconds: 150),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ThemeConstants.padding.sp,
                      vertical: ThemeConstants.padding.sp / 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorController.themeData.value.colorScheme.primary
                          .withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(
                        ThemeConstants.cardRadius.sp,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: colorController.themeData.value.shadowColor
                              .withValues(alpha: 0.2),
                          blurRadius: 5.sp,
                          spreadRadius: 1.sp,
                          offset: Offset(0, 5.sp),
                        ),
                      ],
                    ),
                    child:
                        conversionController.isLoading.value
                            ? SizedBox(
                              height: ThemeConstants.iconSize.sp,
                              width: ThemeConstants.iconSize.sp,
                              child: Center(
                                child: CircularProgressIndicator(
                                  constraints: BoxConstraints(
                                    minHeight: ThemeConstants.iconSize.sp,
                                    minWidth: ThemeConstants.iconSize.sp,
                                    maxHeight: ThemeConstants.iconSize.sp,
                                    maxWidth: ThemeConstants.iconSize.sp,
                                  ),
                                ),
                              ),
                            )
                            : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                makeAmount(),
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
                                              .onPrimaryContainer,
                                      fontSize:
                                          ThemeConstants.buttonFontSize.sp,
                                    ),
                              ),
                            ),
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              ListTile(
                leading: IconButton(
                  onPressed: () {
                    selectToCurrency(context);
                  },
                  style: IconButton.styleFrom(padding: EdgeInsets.zero),
                  icon: Container(
                    width: 25.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: ThemeConstants.padding.sp,
                      vertical: ThemeConstants.padding.sp / 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorController.themeData.value.colorScheme.primary
                          .withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(
                        ThemeConstants.cardRadius.sp,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: colorController.themeData.value.shadowColor
                              .withValues(alpha: 0.2),
                          blurRadius: 5.sp,
                          spreadRadius: 1.sp,
                          offset: Offset(0, 5.sp),
                        ),
                      ],
                    ),
                    child: Text(
                      '${conversionController.toCurrency.value.code} ${conversionController.toCurrency.value.flag != null ? CurrencyUtils.currencyToEmoji(conversionController.toCurrency.value) : conversionController.toCurrency.value.flag}',
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
                                    .onPrimaryContainer,
                            fontSize: ThemeConstants.buttonFontSize.sp,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                title: GestureDetector(
                  onTap: () {
                    if (conversionController.isLoading.value) return;
                    Get.bottomSheet(
                      Container(
                        height: 40.h,
                        width: 100.w,
                        color:
                            colorController.themeData.value.colorScheme.primary,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            for (int i = 0; i <= 3; i++)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  for (int j = 0; j < 3; j++)
                                    !(i == 3 && j == 0)
                                        ? SizedBox(
                                          height: 5.h,
                                          width: 10.w,
                                          child: TextButton(
                                            onPressed: () {
                                              if (i < 3) {
                                                conversionController
                                                        .toAmount
                                                        .value =
                                                    conversionController
                                                            .toAmount
                                                            .value *
                                                        10 +
                                                    (((i) * 3) + j + 1);
                                              } else {
                                                if (j == 1) {
                                                  conversionController
                                                          .toAmount
                                                          .value =
                                                      conversionController
                                                              .toAmount
                                                              .value *
                                                          10 +
                                                      0;
                                                } else {
                                                  conversionController
                                                          .toAmount
                                                          .value =
                                                      (conversionController
                                                                  .toAmount
                                                                  .value /
                                                              10)
                                                          .floorToDouble();
                                                }
                                              }

                                              conversionController
                                                  .fromAmount
                                                  .value = conversionController
                                                      .toAmount
                                                      .value /
                                                  conversionController
                                                      .rate
                                                      .value;
                                            },
                                            style: TextButton.styleFrom(
                                              backgroundColor: colorController
                                                  .themeData
                                                  .value
                                                  .colorScheme
                                                  .primaryContainer
                                                  .withValues(alpha: 0.2),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      ThemeConstants
                                                          .cardRadius
                                                          .sp,
                                                    ),
                                              ),
                                              padding: EdgeInsets.zero,
                                            ),
                                            child: Text(
                                              i < 3
                                                  ? '${(i) * 3 + (j + 1)}'
                                                  : (j == 1 ? '0' : '←'),
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
                                                        ThemeConstants
                                                            .subtitleFontSize
                                                            .sp,
                                                  ),
                                            ),
                                          ),
                                        )
                                        : SizedBox(height: 5.h, width: 10.w),
                                ],
                              ),
                          ],
                        ),
                      ),
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      barrierColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      isDismissible: true,
                      enterBottomSheetDuration: Duration(milliseconds: 150),
                      exitBottomSheetDuration: Duration(milliseconds: 150),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ThemeConstants.padding.sp,
                      vertical: ThemeConstants.padding.sp / 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorController.themeData.value.colorScheme.primary
                          .withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(
                        ThemeConstants.cardRadius.sp,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: colorController.themeData.value.shadowColor
                              .withValues(alpha: 0.2),
                          blurRadius: 5.sp,
                          spreadRadius: 1.sp,
                          offset: Offset(0, 5.sp),
                        ),
                      ],
                    ),
                    child:
                        conversionController.isLoading.value
                            ? SizedBox(
                              height: ThemeConstants.iconSize.sp,
                              width: ThemeConstants.iconSize.sp,
                              child: Center(
                                child: CircularProgressIndicator(
                                  constraints: BoxConstraints(
                                    minHeight: ThemeConstants.iconSize.sp,
                                    minWidth: ThemeConstants.iconSize.sp,
                                    maxHeight: ThemeConstants.iconSize.sp,
                                    maxWidth: ThemeConstants.iconSize.sp,
                                  ),
                                ),
                              ),
                            )
                            : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                makeConvertedAmount(),
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
                                              .onPrimaryContainer,
                                      fontSize:
                                          ThemeConstants.buttonFontSize.sp,
                                    ),
                              ),
                            ),
                  ),
                ),
              ),
              SizedBox(height: 3.h),

              Text(
                '1 ${conversionController.fromCurrency.value.symbol} = ${conversionController.rate.value.toStringAsFixed(3)} ${conversionController.toCurrency.value.symbol}',
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
