import 'package:currency_converter/data/repository/fetch_conversion_rates_repository.dart';
import 'package:currency_converter/data/request/conversion_rates_from_base_currency_request.dart';
import 'package:currency_converter/domain/repository/fetch_conversion_rates_repository.dart';
import 'package:currency_converter/utils/constants/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

FetchConversionRatesRepository repository =
    FetchConversionRatesRepositoryImpl();

Future<double> fetchConversionRate({
  required String fromCurrency,
  required String toCurrency,
}) async {
  ConversionRatesFromBaseCurrencyRequest request =
      ConversionRatesFromBaseCurrencyRequest(
        fromCurrency: fromCurrency,
        toCurrency: toCurrency,
      );
  try {
    var responee = await repository.fetchConversionRate(request);
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
    return 0.0;
  }
}
