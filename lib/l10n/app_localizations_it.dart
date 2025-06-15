// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get helloWorld => 'Ciao mondo!';

  @override
  String get changeThemeColor => 'Cambia colore del tema';

  @override
  String changeThemeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(
      mode,
      {
        'light': 'chiara',
        'dark': 'scura',
        'other': 'di sistema',
      },
    );
    return 'Passa alla modalità $_temp0';
  }

  @override
  String get changeLanguage => 'Cambia lingua';

  @override
  String get language => 'Italiano';

  @override
  String get en => 'Inglese';

  @override
  String get es => 'Spagnolo';

  @override
  String get fr => 'Francese';

  @override
  String get de => 'Tedesco';

  @override
  String get it => 'Italiano';

  @override
  String get pt => 'Portoghese';

  @override
  String get ru => 'Russo';

  @override
  String get zh => 'Cinese';

  @override
  String get ja => 'Giapponese';

  @override
  String get hi => 'Hindi';

  @override
  String get kn => 'Kannada';

  @override
  String get ta => 'Tamil';

  @override
  String get te => 'Telugu';

  @override
  String get ml => 'Malayalam';

  @override
  String get ar => 'Arabo';

  @override
  String get nl => 'Olandese';

  @override
  String get el => 'Greco';

  @override
  String get id => 'Indonesiano';

  @override
  String get ko => 'Coreano';

  @override
  String get pl => 'Polacco';

  @override
  String get ro => 'Rumeno';

  @override
  String get tr => 'Turco';
}
