// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get helloWorld => 'Selam Dünya!';

  @override
  String get changeThemeColor => 'Tema Rengini Değiştir';

  @override
  String changeThemeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(
      mode,
      {
        'light': 'Açık moda',
        'dark': 'Koyu moda',
        'other': 'Sistem moduna',
      },
    );
    return '$_temp0 Geç';
  }

  @override
  String get changeLanguage => 'Dili değiştir';

  @override
  String get language => 'Türkçe';

  @override
  String get en => 'İngilizce';

  @override
  String get es => 'İspanyolca';

  @override
  String get fr => 'Fransızca';

  @override
  String get de => 'Almanca';

  @override
  String get it => 'İtalyanca';

  @override
  String get pt => 'Portekizce';

  @override
  String get ru => 'Rusça';

  @override
  String get zh => 'Çince';

  @override
  String get ja => 'Japonca';

  @override
  String get hi => 'Hintçe';

  @override
  String get kn => 'Kannada';

  @override
  String get ta => 'Tamilce';

  @override
  String get te => 'Telugu';

  @override
  String get ml => 'Malayalam';

  @override
  String get ar => 'Arapça';

  @override
  String get nl => 'Flemenkçe';

  @override
  String get el => 'Yunanca';

  @override
  String get id => 'Endonezce';

  @override
  String get ko => 'Korece';

  @override
  String get pl => 'Lehçe';

  @override
  String get ro => 'Romence';

  @override
  String get tr => 'Türkçe';
}
