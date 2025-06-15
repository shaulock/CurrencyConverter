// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get helloWorld => 'مرحبا بالعالم!';

  @override
  String get changeThemeColor => 'تغيير لون السمة';

  @override
  String changeThemeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(
      mode,
      {
        'light': 'الفاتح',
        'dark': 'الداكن',
        'other': 'النظام',
      },
    );
    return '$_temp0 التبديل إلى الوضع';
  }

  @override
  String get changeLanguage => 'تغيير اللغة';

  @override
  String get language => 'العربية';

  @override
  String get en => 'الإنجليزية';

  @override
  String get es => 'الإسبانية';

  @override
  String get fr => 'الفرنسية';

  @override
  String get de => 'الألمانية';

  @override
  String get it => 'الإيطالية';

  @override
  String get pt => 'البرتغالية';

  @override
  String get ru => 'الروسية';

  @override
  String get zh => 'الصينية';

  @override
  String get ja => 'اليابانية';

  @override
  String get hi => 'الهندية';

  @override
  String get kn => 'الكنادا';

  @override
  String get ta => 'التاميلية';

  @override
  String get te => 'التيلجو';

  @override
  String get ml => 'المالايالامية';

  @override
  String get ar => 'العربية';

  @override
  String get nl => 'الهولندية';

  @override
  String get el => 'اليونانية';

  @override
  String get id => 'الإندونيسية';

  @override
  String get ko => 'الكورية';

  @override
  String get pl => 'البولندية';

  @override
  String get ro => 'الرومانية';

  @override
  String get tr => 'التركية';
}
