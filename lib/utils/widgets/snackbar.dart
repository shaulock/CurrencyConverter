import 'package:currency_converter/utils/constants/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

showErrorSnakcbar(String message) => Get.showSnackbar(
  GetSnackBar(
    title: "Error Occurred",
    message: message,
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
