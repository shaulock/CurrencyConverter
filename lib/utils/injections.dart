import 'package:currency_converter/presentation/controller/home/date_time_controller.dart';
import 'package:currency_converter/presentation/controller/settings/color_controller.dart';
import 'package:currency_converter/presentation/controller/settings/language_and_format_controller.dart';
import 'package:get/get.dart';

injectControllers() {
  Get.put(ColorController(), permanent: true, tag: 'color');
  Get.put(LanguageController(), permanent: true, tag: 'language');
  Get.put(DateTimeController(), permanent: true, tag: 'date_time');
}
