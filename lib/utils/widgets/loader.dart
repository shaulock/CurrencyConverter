import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Widget loader({
  required RxDouble percentFinished,
  double maxWidth = 80,
  double height = 2,
  double borderRadius = 10,
  Color? color,
  Color? backgroundColor,
}) {
  return Obx(
    () => Container(
      width: maxWidth.w,
      height: height.h,
      decoration: BoxDecoration(
        color: backgroundColor ?? Get.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      alignment: Alignment.centerLeft,
      child: AnimatedContainer(
        alignment: Alignment.centerLeft,
        duration: Duration(milliseconds: 10),
        width: (percentFinished.value / 100 * maxWidth.w).w,
        decoration: BoxDecoration(
          color: color ?? Get.theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    ),
  );
}
