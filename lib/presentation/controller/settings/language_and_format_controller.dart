import 'package:get/get.dart';

class LanguageAndFormatController extends GetxController {
  Rx<String> selectedLanguage = 'English'.obs;
  Rx<String> selectedDateFormat = 'yyyy-MM-dd'.obs;
  Rx<String> selectedTimeFormat = 'jj:mm'.obs;

  void changeLanguage(String languageCode) {
    selectedLanguage.value = languageCode;
  }

  void changeDateFormat(String format) {
    selectedDateFormat.value = format;
  }

  void changeTimeFormat(String format) {
    selectedTimeFormat.value = format;
  }
}
