import 'package:currency_converter/l10n/app_localizations.dart';
import 'package:currency_converter/presentation/controller/settings/color_controller.dart';
import 'package:currency_converter/presentation/controller/settings/language_and_format_controller.dart';
import 'package:get/get.dart';

final ColorController colorController = Get.find(tag: 'color');
final LanguageAndFormatController languageAndFormatController = Get.find(
  tag: 'language_and_format',
);

List<String> supportedLanguages = [
  'English',
  'Español',
  'Français',
  'Deutsch',
  'Italiano',
  'Português',
  'Русский',
  '中文',
  '日本語',
  'हिंदी',
  'తెలుగు',
  'தமிழ்',
  'മലയാളം',
  'ಕನ್ನಡ',
  'العربية',
  'Nederlands',
  'Ελληνικά',
  'Bahasa Indonesia',
  '한국어',
  'Polski',
  'Română',
  'Türkçe',
];

String supportedLanguageCodes(String language) {
  switch (language) {
    case 'English':
      return 'en';
    case 'Español':
      return 'es';
    case 'Français':
      return 'fr';
    case 'Deutsch':
      return 'de';
    case 'Italiano':
      return 'it';
    case 'Português':
      return 'pt';
    case 'Русский':
      return 'ru';
    case '中文':
      return 'zh';
    case '日本語':
      return 'ja';
    case 'हिंदी':
      return 'hi';
    case 'తెలుగు':
      return 'te';
    case 'தமிழ்':
      return 'ta';
    case 'മലയാളം':
      return 'ml';
    case 'ಕನ್ನಡ':
      return 'kn';
    case 'العربية':
      return 'ar';
    case 'Nederlands':
      return 'nl';
    case 'Ελληνικά':
      return 'el';
    case 'Bahasa Indonesia':
      return 'id';
    case '한국어':
      return 'ko';
    case 'Polski':
      return 'pl';
    case 'Română':
      return 'ro';
    case 'Türkçe':
      return 'tr';
    default:
      return AppLocalizations.of(Get.context!)!.en;
  }
}

String supportedLanguageNames(String language) {
  switch (language) {
    case 'English':
      return AppLocalizations.of(Get.context!)!.en;
    case 'Español':
      return AppLocalizations.of(Get.context!)!.es;
    case 'Français':
      return AppLocalizations.of(Get.context!)!.fr;
    case 'Deutsch':
      return AppLocalizations.of(Get.context!)!.de;
    case 'Italiano':
      return AppLocalizations.of(Get.context!)!.it;
    case 'Português':
      return AppLocalizations.of(Get.context!)!.pt;
    case 'Русский':
      return AppLocalizations.of(Get.context!)!.ru;
    case '中文':
      return AppLocalizations.of(Get.context!)!.zh;
    case '日本語':
      return AppLocalizations.of(Get.context!)!.ja;
    case 'हिंदी':
      return AppLocalizations.of(Get.context!)!.hi;
    case 'తెలుగు':
      return AppLocalizations.of(Get.context!)!.te;
    case 'தமிழ்':
      return AppLocalizations.of(Get.context!)!.ta;
    case 'മലയാളം':
      return AppLocalizations.of(Get.context!)!.ml;
    case 'ಕನ್ನಡ':
      return AppLocalizations.of(Get.context!)!.kn;
    case 'العربية':
      return AppLocalizations.of(Get.context!)!.ar;
    case 'Nederlands':
      return AppLocalizations.of(Get.context!)!.nl;
    case 'Ελληνικά':
      return AppLocalizations.of(Get.context!)!.el;
    case 'Bahasa Indonesia':
      return AppLocalizations.of(Get.context!)!.id;
    case '한국어':
      return AppLocalizations.of(Get.context!)!.ko;
    case 'Polski':
      return AppLocalizations.of(Get.context!)!.pl;
    case 'Română':
      return AppLocalizations.of(Get.context!)!.ro;
    case 'Türkçe':
      return AppLocalizations.of(Get.context!)!.tr;
    default:
      return AppLocalizations.of(Get.context!)!.en;
  }
}
