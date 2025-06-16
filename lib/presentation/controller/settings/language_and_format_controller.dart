import 'dart:ui';

import 'package:currency_converter/utils/constants/constants_base.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  late Rx<String> selectedLanguage;

  @override
  void onInit() {
    super.onInit();
    selectedLanguage = settings.getLanguage().obs;
    updateLocale();
  }

  void updateLocale() {
    switch (selectedLanguage.value) {
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
  }

  void changeLanguage(String language) {
    selectedLanguage.value = language;
    settings.saveLanguage(language);
    updateLocale();
  }
}
