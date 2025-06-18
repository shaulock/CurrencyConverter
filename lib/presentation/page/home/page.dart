import 'dart:async';

import 'package:currency_converter/l10n/app_localizations.dart';
import 'package:currency_converter/utils/constants/constants_base.dart';
import 'package:currency_converter/utils/constants/theme_constants.dart';
import 'package:currency_converter/utils/local_storage/conversion.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
    return makeConvertedAmountFromDouble(conversionController.toAmountDouble);
  }

  String makeConvertedAmountFromDouble(double amount, {int decimal = 2}) {
    return (conversionController.toCurrency.value.symbolOnLeft
            ? conversionController.toCurrency.value.symbol
            : '') +
        (conversionController.toCurrency.value.spaceBetweenAmountAndSymbol &&
                conversionController.toCurrency.value.symbolOnLeft
            ? ' '
            : '') +
        NumberFormat.simpleCurrency(
          decimalDigits: decimal,
          name: '',
          locale: supportedLanguageCodes(
            languageAndFormatController.selectedLanguage.value,
          ),
        ).format(amount) +
        (conversionController.toCurrency.value.spaceBetweenAmountAndSymbol &&
                !conversionController.toCurrency.value.symbolOnLeft
            ? ' '
            : '') +
        (conversionController.toCurrency.value.symbolOnLeft
            ? ''
            : conversionController.toCurrency.value.symbol);
  }

  String makeFromAmountFromDouble(double amount, {int decimal = 2}) {
    return (conversionController.fromCurrency.value.symbolOnLeft
            ? conversionController.fromCurrency.value.symbol
            : '') +
        (conversionController.fromCurrency.value.spaceBetweenAmountAndSymbol &&
                conversionController.fromCurrency.value.symbolOnLeft
            ? ' '
            : '') +
        NumberFormat.simpleCurrency(
          decimalDigits: decimal,
          name: '',
          locale: supportedLanguageCodes(
            languageAndFormatController.selectedLanguage.value,
          ),
        ).format(amount) +
        (conversionController.fromCurrency.value.spaceBetweenAmountAndSymbol &&
                !conversionController.fromCurrency.value.symbolOnLeft
            ? ' '
            : '') +
        (conversionController.fromCurrency.value.symbolOnLeft
            ? ''
            : conversionController.fromCurrency.value.symbol);
  }

  String makeAmount() {
    return makeFromAmountFromDouble(conversionController.fromAmountDouble);
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
    Rx<Color> fromCursorColor = Colors.transparent.obs;
    Rx<Color> toCursorColor = Colors.transparent.obs;
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
                    height: 30.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color:
                          colorController.themeData.value.colorScheme.primary,
                      borderRadius: BorderRadius.zero,
                    ),
                    child: SingleChildScrollView(
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
                                          colorController.changeSeedColor(
                                            color,
                                          );
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
                                colorController.themeMode.value ==
                                        ThemeMode.dark
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
                                                ThemeConstants
                                                    .buttonFontSize
                                                    .sp,
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
                                        height:
                                            ThemeConstants.buttonFontSize.sp,
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
                ),
              );
            },
          ),
          backgroundColor: colorController.themeData.value.colorScheme.primary,
          title: Text(
            AppLocalizations.of(context)!.currencyConverter,
            style: colorController.themeData.value.textTheme.headlineMedium
                ?.copyWith(
                  color: colorController.themeData.value.colorScheme.onPrimary,
                ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.history_rounded,
                size: ThemeConstants.iconSize.sp,
                color: colorController.themeData.value.colorScheme.onPrimary,
              ),
              onPressed: () {
                Get.bottomSheet(
                  Obx(
                    () => Container(
                      height: 50.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color:
                            colorController.themeData.value.colorScheme.primary,

                        border: Border.all(
                          color:
                              colorController
                                  .themeData
                                  .value
                                  .colorScheme
                                  .primary,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: ThemeConstants.padding.sp,
                              right: ThemeConstants.padding.sp,
                              top: ThemeConstants.padding.sp / 2,
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.history,
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
                                            .primaryContainer,
                                    fontSize:
                                        ThemeConstants.subtitleFontSize.sp,
                                    fontWeight: FontWeight.w900,
                                  ),

                              textAlign: TextAlign.left,
                            ),
                          ),
                          Divider(
                            color:
                                colorController
                                    .themeData
                                    .value
                                    .colorScheme
                                    .onPrimary,
                            thickness: 1,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: conversionController.histories.length,
                              itemBuilder: (context, index) {
                                Conversion conversion =
                                    conversionController.histories[index];
                                Currency fromCurrency =
                                    CurrencyService().findByCode(
                                      conversion.fromCurrency,
                                    )!;
                                Currency toCurrency =
                                    CurrencyService().findByCode(
                                      conversion.toCurrency,
                                    )!;
                                return ListTile(
                                  leading: IconButton(
                                    onPressed: () async {
                                      history.removeHistory(conversion);
                                      conversionController.histories
                                          .removeWhere(
                                            (fav) =>
                                                fav.conversionKey ==
                                                conversion.conversionKey,
                                          );
                                      if (conversionController
                                          .histories
                                          .isEmpty) {
                                        Get.back();
                                        history.addHistory(conversion);
                                        conversionController.histories.add(
                                          conversion,
                                        );
                                      }
                                    },
                                    icon: Icon(
                                      Icons.remove_circle_rounded,
                                      size: ThemeConstants.iconSize.sp,
                                      color:
                                          colorController
                                              .themeData
                                              .value
                                              .colorScheme
                                              .onPrimary,
                                    ),
                                  ),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        '${fromCurrency.code} ${fromCurrency.flag != null ? CurrencyUtils.currencyToEmoji(fromCurrency) : fromCurrency.flag}',
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
                                                      .primaryContainer,
                                              fontSize:
                                                  ThemeConstants
                                                      .subtitleFontSize
                                                      .sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(
                                        '↔',
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
                                                      .primaryContainer,
                                              fontSize:
                                                  ThemeConstants
                                                      .subtitleFontSize
                                                      .sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(
                                        '${toCurrency.code} ${toCurrency.flag != null ? CurrencyUtils.currencyToEmoji(toCurrency) : toCurrency.flag}',
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
                                                      .primaryContainer,
                                              fontSize:
                                                  ThemeConstants
                                                      .subtitleFontSize
                                                      .sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),

                                  trailing: IconButton(
                                    onPressed: () async {
                                      await conversionController
                                          .setFromCurrency(fromCurrency);
                                      await conversionController.setToCurrency(
                                        toCurrency,
                                      );
                                      conversionController.fromAmount.value =
                                          100;
                                      conversionController.toAmount.value =
                                          conversionController.rate.value * 100;
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward_rounded,
                                      size: ThemeConstants.iconSize.sp,
                                      color:
                                          colorController
                                              .themeData
                                              .value
                                              .colorScheme
                                              .primaryContainer,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        backgroundColor:
            colorController.themeData.value.colorScheme.primaryContainer,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.5.w),
          child: Column(
            spacing: 3.h,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                children: [
                  SizedBox(height: 3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 33.w,
                        child: Text(
                          '${conversionController.fromCurrency.value.name}\n(${conversionController.fromCurrency.value.code})',
                          maxLines: 2,
                          textAlign: TextAlign.left,
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
                                fontSize: ThemeConstants.defaultFontSize.sp,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (conversionController.isLoading.value) return;
                          conversionController.swapCurrencies();
                          fromCursorColor.value = Colors.transparent;
                          toCursorColor.value = Colors.transparent;
                        },
                        icon: Icon(
                          Icons.compare_arrows,
                          size: ThemeConstants.iconSize.sp,
                          color:
                              colorController
                                  .themeData
                                  .value
                                  .colorScheme
                                  .onPrimaryContainer,
                        ),
                      ),
                      SizedBox(
                        width: 33.w,
                        child: Text(
                          '${conversionController.toCurrency.value.name}\n(${conversionController.toCurrency.value.code})',
                          maxLines: 2,
                          textAlign: TextAlign.right,
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
                                fontSize: ThemeConstants.defaultFontSize.sp,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Container(
                decoration: BoxDecoration(
                  color: colorController.themeData.value.colorScheme.primary
                      .withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(
                    ThemeConstants.cardRadius.sp,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(width: 5.w),
                    SizedBox(
                      width: 20.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              selectFromCurrency(context);
                            },
                            style: IconButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            icon: Text(
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
                          SizedBox(width: 1.w),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            size: ThemeConstants.iconSize.sp,
                            color:
                                colorController
                                    .themeData
                                    .value
                                    .colorScheme
                                    .onPrimaryContainer,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Container(
                      height: 6.h,
                      width: 1.w,
                      color:
                          colorController
                              .themeData
                              .value
                              .colorScheme
                              .primaryContainer,
                    ),
                    SizedBox(width: 2.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (conversionController.isLoading.value) return;
                          Timer.periodic(Duration(milliseconds: 500), (timer) {
                            if (!(Get.isBottomSheetOpen ?? true)) {
                              fromCursorColor.value = Colors.transparent;
                              timer.cancel();
                            } else {
                              fromCursorColor.value =
                                  fromCursorColor.value == Colors.transparent
                                      ? colorController
                                          .themeData
                                          .value
                                          .colorScheme
                                          .onPrimaryContainer
                                      : Colors.transparent;
                            }
                          });
                          Get.bottomSheet(
                            Container(
                              height: 32.h,
                              width: 100.w,
                              color:
                                  colorController
                                      .themeData
                                      .value
                                      .colorScheme
                                      .primary,
                              child: Column(
                                children: [
                                  for (int i = 0; i <= 3; i++)
                                    Row(
                                      children: [
                                        for (int j = 0; j < 3; j++)
                                          !(i == 3 && j == 0)
                                              ? Expanded(
                                                child: SizedBox(
                                                  child: TextButton(
                                                    onPressed: () {
                                                      if (conversionController
                                                                  .fromAmount
                                                                  .value
                                                                  .toStringAsFixed(
                                                                    0,
                                                                  )
                                                                  .length >=
                                                              10 &&
                                                          !(i == 3 && j == 2)) {
                                                        return;
                                                      }
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
                                                              .value =
                                                          conversionController
                                                              .fromAmount
                                                              .value *
                                                          conversionController
                                                              .rate
                                                              .value;
                                                    },
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          WidgetStatePropertyAll(
                                                            Colors.transparent,
                                                          ),

                                                      shape: WidgetStatePropertyAll(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                0,
                                                              ),
                                                        ),
                                                      ),
                                                      padding:
                                                          WidgetStatePropertyAll(
                                                            EdgeInsets.zero,
                                                          ),
                                                    ),
                                                    child: Container(
                                                      height: 7.5.h,
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        i < 3
                                                            ? '${(i) * 3 + (j + 1)}'
                                                            : (j == 1
                                                                ? '0'
                                                                : '←'),
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
                                                                      .titleFontSize
                                                                      .sp,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                              : Expanded(child: SizedBox()),
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
                            enterBottomSheetDuration: Duration(
                              milliseconds: 150,
                            ),
                            exitBottomSheetDuration: Duration(
                              milliseconds: 150,
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              ThemeConstants.cardRadius.sp,
                            ),
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
                                  : Row(
                                    children: [
                                      Text(
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
                                                  ThemeConstants
                                                      .subtitleFontSize
                                                      .sp,
                                            ),
                                      ),
                                      SizedBox(width: 1.w),
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 250),
                                        height: 4.h,
                                        width: 2,
                                        color: fromCursorColor.value,
                                      ),
                                    ],
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  color: colorController.themeData.value.colorScheme.primary
                      .withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(
                    ThemeConstants.cardRadius.sp,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(width: 5.w),
                    SizedBox(
                      width: 20.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              selectToCurrency(context);
                            },
                            style: IconButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            icon: Text(
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
                          SizedBox(width: 1.w),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            size: ThemeConstants.iconSize.sp,
                            color:
                                colorController
                                    .themeData
                                    .value
                                    .colorScheme
                                    .onPrimaryContainer,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Container(
                      height: 6.h,
                      width: 1.w,
                      color:
                          colorController
                              .themeData
                              .value
                              .colorScheme
                              .primaryContainer,
                    ),
                    SizedBox(width: 2.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (conversionController.isLoading.value) return;
                          Timer.periodic(Duration(milliseconds: 500), (timer) {
                            if (!(Get.isBottomSheetOpen ?? true)) {
                              toCursorColor.value = Colors.transparent;
                              timer.cancel();
                            } else {
                              toCursorColor.value =
                                  toCursorColor.value == Colors.transparent
                                      ? colorController
                                          .themeData
                                          .value
                                          .colorScheme
                                          .onPrimaryContainer
                                      : Colors.transparent;
                            }
                          });
                          Get.bottomSheet(
                            Container(
                              height: 32.h,
                              width: 100.w,
                              color:
                                  colorController
                                      .themeData
                                      .value
                                      .colorScheme
                                      .primary,
                              child: Column(
                                children: [
                                  for (int i = 0; i <= 3; i++)
                                    Row(
                                      children: [
                                        for (int j = 0; j < 3; j++)
                                          !(i == 3 && j == 0)
                                              ? Expanded(
                                                child: SizedBox(
                                                  child: TextButton(
                                                    onPressed: () {
                                                      if (conversionController
                                                                  .toAmount
                                                                  .value
                                                                  .toStringAsFixed(
                                                                    0,
                                                                  )
                                                                  .length >=
                                                              10 &&
                                                          !(i == 3 && j == 2)) {
                                                        return;
                                                      }
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
                                                              .value =
                                                          conversionController
                                                              .toAmount
                                                              .value /
                                                          conversionController
                                                              .rate
                                                              .value;
                                                    },
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          WidgetStatePropertyAll(
                                                            Colors.transparent,
                                                          ),

                                                      shape: WidgetStatePropertyAll(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                0,
                                                              ),
                                                        ),
                                                      ),
                                                      padding:
                                                          WidgetStatePropertyAll(
                                                            EdgeInsets.zero,
                                                          ),
                                                    ),
                                                    child: Container(
                                                      height: 7.5.h,
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        i < 3
                                                            ? '${(i) * 3 + (j + 1)}'
                                                            : (j == 1
                                                                ? '0'
                                                                : '←'),
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
                                                                      .titleFontSize
                                                                      .sp,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                              : Expanded(child: SizedBox()),
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
                            enterBottomSheetDuration: Duration(
                              milliseconds: 150,
                            ),
                            exitBottomSheetDuration: Duration(
                              milliseconds: 150,
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              ThemeConstants.cardRadius.sp,
                            ),
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
                                  : Row(
                                    children: [
                                      Text(
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
                                                  ThemeConstants
                                                      .subtitleFontSize
                                                      .sp,
                                            ),
                                      ),
                                      SizedBox(width: 1.w),
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 250),
                                        height: 4.h,
                                        width: 2,
                                        color: toCursorColor.value,
                                      ),
                                    ],
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    makeFromAmountFromDouble(1, decimal: 0),

                    textAlign: TextAlign.center,
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
                          fontSize: ThemeConstants.titleFontSize.sp,
                        ),
                  ),
                  Text(
                    conversionController.fromCurrency.value.code,
                    textAlign: TextAlign.center,
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
                          fontSize: ThemeConstants.titleFontSize.sp,
                        ),
                  ),
                  Text(
                    ' = ',
                    textAlign: TextAlign.center,
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
                          fontSize: ThemeConstants.titleFontSize.sp,
                        ),
                  ),
                  Text(
                    makeConvertedAmountFromDouble(
                      1 * conversionController.rate.value,
                      decimal: 4,
                    ),
                    textAlign: TextAlign.center,
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
                          fontSize: ThemeConstants.titleFontSize.sp,
                        ),
                  ),
                  Text(
                    conversionController.toCurrency.value.code,
                    textAlign: TextAlign.center,
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
                          fontSize: ThemeConstants.titleFontSize.sp,
                        ),
                  ),
                ],
              ),

              Expanded(
                child: Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: colorController.themeData.value.colorScheme.primary
                        .withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(
                      ThemeConstants.cardRadius.sp,
                    ),
                    border: Border.all(
                      color:
                          colorController.themeData.value.colorScheme.primary,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: ThemeConstants.padding.sp,
                          right: ThemeConstants.padding.sp,
                          top: ThemeConstants.padding.sp / 2,
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.favourites,
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
                                        .primary,
                                fontSize: ThemeConstants.subtitleFontSize.sp,
                                fontWeight: FontWeight.w900,
                              ),

                          textAlign: TextAlign.left,
                        ),
                      ),
                      Divider(
                        color:
                            colorController.themeData.value.colorScheme.primary,
                        thickness: 1,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: conversionController.favourites.length,
                          itemBuilder: (context, index) {
                            Conversion conversion =
                                conversionController.favourites[index];
                            Currency fromCurrency =
                                CurrencyService().findByCode(
                                  conversion.fromCurrency,
                                )!;
                            Currency toCurrency =
                                CurrencyService().findByCode(
                                  conversion.toCurrency,
                                )!;
                            return ListTile(
                              leading: IconButton(
                                onPressed: () async {
                                  favorites.removeFavorite(conversion);
                                  conversionController.favourites.removeWhere(
                                    (fav) =>
                                        fav.conversionKey ==
                                        conversion.conversionKey,
                                  );
                                  if (conversion.conversionKey ==
                                      conversionController
                                          .conversion
                                          .value
                                          .conversionKey) {
                                    conversionController.isFavorite.value =
                                        false;
                                  }
                                },
                                icon: Icon(
                                  Icons.star_rounded,
                                  size: ThemeConstants.iconSize.sp,
                                  color:
                                      colorController
                                          .themeData
                                          .value
                                          .colorScheme
                                          .primary,
                                ),
                              ),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '${fromCurrency.code} ${fromCurrency.flag != null ? CurrencyUtils.currencyToEmoji(fromCurrency) : fromCurrency.flag}',
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
                                                  .primary,
                                          fontSize:
                                              ThemeConstants
                                                  .subtitleFontSize
                                                  .sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    '↔',
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
                                                  .primary,
                                          fontSize:
                                              ThemeConstants
                                                  .subtitleFontSize
                                                  .sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    '${toCurrency.code} ${toCurrency.flag != null ? CurrencyUtils.currencyToEmoji(toCurrency) : toCurrency.flag}',
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
                                                  .primary,
                                          fontSize:
                                              ThemeConstants
                                                  .subtitleFontSize
                                                  .sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),

                              trailing: IconButton(
                                onPressed: () async {
                                  await conversionController.setFromCurrency(
                                    fromCurrency,
                                  );
                                  await conversionController.setToCurrency(
                                    toCurrency,
                                  );
                                  conversionController.fromAmount.value = 100;
                                  conversionController.toAmount.value =
                                      conversionController.rate.value * 100;
                                },
                                icon: Icon(
                                  Icons.arrow_forward_rounded,
                                  size: ThemeConstants.iconSize.sp,
                                  color:
                                      colorController
                                          .themeData
                                          .value
                                          .colorScheme
                                          .primary,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 3.h),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: colorController.themeData.value.colorScheme.primary,
          onPressed: () {
            conversionController.isFavorite.value
                ? conversionController.removeFavorite()
                : conversionController.addFavorite();
          },
          child: Icon(
            conversionController.isFavorite.value
                ? Icons.star_rounded
                : Icons.star_outline_rounded,
            size: ThemeConstants.iconSize.sp,
            color: colorController.themeData.value.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
