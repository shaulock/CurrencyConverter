import 'package:currency_converter/data/repository/fetch_currency_list_repository.dart';
import 'package:currency_converter/data/request/currency_list_request.dart';
import 'package:currency_converter/domain/repository/fetch_currency_list_repository.dart';
import 'package:currency_converter/utils/constants/theme_constants.dart';
import 'package:currency_converter/utils/constants/url_constants.dart';
import 'package:currency_converter/utils/responses/currency_list_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

FetchCurrencyListRepository repository = FetchCurrencyListRepositoryImpl();

Future<CurrencyListResponse> fetchCurrencyList(DateTime? date) async {
  String dateValue =
      date != null
          ? DateFormat('yyyy-MM-dd').format(date)
          : UrlConstants.dateNow;
  String apiVersion = UrlConstants.apiVersion;
  CurrencyListRequest request = CurrencyListRequest(
    date: dateValue,
    apiVersion: apiVersion,
  );
  try {
    CurrencyListResponse responee = await repository.fetchCurrencyList(request);
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
    return CurrencyListResponse(currencies: {});
  }
}
