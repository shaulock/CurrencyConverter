// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get currencyConverter => 'Kalkulator walut';

  @override
  String get changeThemeColor => 'Zmień kolor motywu';

  @override
  String changeThemeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(
      mode,
      {
        'light': 'jasny',
        'dark': 'ciemny',
        'other': 'systemowy',
      },
    );
    return 'Przełącz na tryb $_temp0';
  }

  @override
  String get changeLanguage => 'Zmień język';

  @override
  String get language => 'Polski';

  @override
  String get en => 'Angielski';

  @override
  String get es => 'Hiszpański';

  @override
  String get fr => 'Francuski';

  @override
  String get de => 'Niemiecki';

  @override
  String get it => 'Włoski';

  @override
  String get pt => 'Portugalski';

  @override
  String get ru => 'Rosyjski';

  @override
  String get zh => 'Chiński';

  @override
  String get ja => 'Japoński';

  @override
  String get hi => 'Hindi';

  @override
  String get kn => 'Kannada';

  @override
  String get ta => 'Tamilski';

  @override
  String get te => 'Telugu';

  @override
  String get ml => 'Malajalam';

  @override
  String get ar => 'Arabski';

  @override
  String get nl => 'Holenderski';

  @override
  String get el => 'Grecki';

  @override
  String get id => 'Indonezyjski';

  @override
  String get ko => 'Koreański';

  @override
  String get pl => 'Polski';

  @override
  String get ro => 'Rumuński';

  @override
  String get tr => 'Turecki';

  @override
  String weekday(String weekday) {
    String _temp0 = intl.Intl.selectLogic(
      weekday,
      {
        'Monday': 'Poniedziałek',
        'Tuesday': 'Wtorek',
        'Wednesday': 'Środa',
        'Thursday': 'Czwartek',
        'Friday': 'Piątek',
        'Saturday': 'Sobota',
        'Sunday': 'Niedziela',
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
        'January': 'Styczeń',
        'February': 'Luty',
        'March': 'Marzec',
        'April': 'Kwiecień',
        'May': 'Maj',
        'June': 'Czerwiec',
        'July': 'Lipiec',
        'August': 'Sierpień',
        'September': 'Wrzesień',
        'October': 'Październik',
        'November': 'Listopad',
        'December': 'Grudzień',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get favourites => 'Ulubione';

  @override
  String get history => 'Historia';
}
