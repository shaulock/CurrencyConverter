// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get currencyConverter => 'Währungswandler';

  @override
  String get changeThemeColor => 'Designfarbe ändern';

  @override
  String changeThemeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(
      mode,
      {
        'light': 'Hell',
        'dark': 'Dunkel',
        'other': 'System',
      },
    );
    return 'In den ${_temp0}modus wechseln';
  }

  @override
  String get changeLanguage => 'Sprache ändern';

  @override
  String get language => 'Deutsch';

  @override
  String get en => 'Englisch';

  @override
  String get es => 'Spanisch';

  @override
  String get fr => 'Französisch';

  @override
  String get de => 'Deutsch';

  @override
  String get it => 'Italienisch';

  @override
  String get pt => 'Portugiesisch';

  @override
  String get ru => 'Russisch';

  @override
  String get zh => 'Chinesisch';

  @override
  String get ja => 'Japanisch';

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
  String get ar => 'Arabisch';

  @override
  String get nl => 'Niederländisch';

  @override
  String get el => 'Griechisch';

  @override
  String get id => 'Indonesisch';

  @override
  String get ko => 'Koreanisch';

  @override
  String get pl => 'Polnisch';

  @override
  String get ro => 'Rumänisch';

  @override
  String get tr => 'Türkisch';

  @override
  String weekday(String weekday) {
    String _temp0 = intl.Intl.selectLogic(
      weekday,
      {
        'Monday': 'Montag',
        'Tuesday': 'Dienstag',
        'Wednesday': 'Mittwoch',
        'Thursday': 'Donnerstag',
        'Friday': 'Freitag',
        'Saturday': 'Samstag',
        'Sunday': 'Sonntag',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String month(String month) {
    String _temp0 = intl.Intl.selectLogic(
      month,
      {
        'January': 'Januar',
        'February': 'Februar',
        'March': 'März',
        'April': 'April',
        'May': 'Mai',
        'June': 'Juni',
        'July': 'Juli',
        'August': 'August',
        'September': 'September',
        'October': 'Oktober',
        'November': 'November',
        'December': 'Dezember',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get favourites => 'Favoriten';

  @override
  String get history => 'Geschichte';
}
