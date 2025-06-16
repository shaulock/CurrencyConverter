import 'package:currency_converter/data/repository/fetch_conversion_rates_repository.dart';
import 'package:currency_converter/data/request/conversion_rates_from_base_currency_request.dart';
import 'package:currency_converter/domain/repository/fetch_conversion_rates_repository.dart';
import 'package:currency_converter/utils/constants/theme_constants.dart';
import 'package:currency_converter/utils/constants/url_constants.dart';
import 'package:currency_converter/utils/responses/conversion_rates_from_base_currency.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

FetchConversionRatesRepository repository =
    FetchConversionRatesRepositoryImpl();

Future<ConversionRatesFromBaseCurrency> fetchConversionRates({
  DateTime? date,
  String baseCurrency = 'usd',
}) async {
  String dateValue =
      date != null
          ? DateFormat('yyyy-MM-dd').format(date)
          : UrlConstants.dateNow;
  String apiVersion = UrlConstants.apiVersion;
  ConversionRatesFromBaseCurrencyRequest request =
      ConversionRatesFromBaseCurrencyRequest(
        date: dateValue,
        apiVersion: apiVersion,
        baseCurrency: baseCurrency,
      );
  try {
    ConversionRatesFromBaseCurrency responee = await repository
        .fetchConversionRates(request);
    return responee;
  } catch (e) {
    Get.showSnackbar(
      GetSnackBar(
        title: "Error Occurred",
        message: e.toString(),
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: Get.theme.colorScheme.errorContainer,
        borderRadius: ThemeConstants.buttonRadius,
        maxWidth: 80.w,
        boxShadows: [
          BoxShadow(
            color: Get.theme.colorScheme.error.withAlpha(100),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
    );
    return ConversionRatesFromBaseCurrency(
      baseCurrency: baseCurrency,
      dateOfRates: DateFormat('yyyy-MM-dd').parse(dateValue),
      multiplicationRates: {},
    );
  }
}
