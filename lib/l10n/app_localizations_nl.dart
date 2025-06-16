// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get helloWorld => 'Hallo Wereld!';

  @override
  String get changeThemeColor => 'Themakleur wijzigen';

  @override
  String changeThemeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(
      mode,
      {
        'light': 'lichte ',
        'dark': 'donkere ',
        'other': 'systeem',
      },
    );
    return 'Overschakelen naar de ${_temp0}modus';
  }

  @override
  String get changeLanguage => 'Taal wijzigen';

  @override
  String get language => 'Nederlands';

  @override
  String get en => 'Engels';

  @override
  String get es => 'Spaans';

  @override
  String get fr => 'Frans';

  @override
  String get de => 'Duits';

  @override
  String get it => 'Italiaans';

  @override
  String get pt => 'Portugees';

  @override
  String get ru => 'Russisch';

  @override
  String get zh => 'Chinees';

  @override
  String get ja => 'Japans';

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
  String get nl => 'Nederlands';

  @override
  String get el => 'Grieks';

  @override
  String get id => 'Indonesisch';

  @override
  String get ko => 'Koreaans';

  @override
  String get pl => 'Pools';

  @override
  String get ro => 'Roemeens';

  @override
  String get tr => 'Turks';

  @override
  String weekday(String weekday) {
    String _temp0 = intl.Intl.selectLogic(
      weekday,
      {
        'Monday': 'Maandag',
        'Tuesday': 'Dinsdag',
        'Wednesday': 'Woensdag',
        'Thursday': 'Donderdag',
        'Friday': 'Vrijdag',
        'Saturday': 'Zaterdag',
        'Sunday': 'Zondag',
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
        'January': 'Januari',
        'February': 'Februari',
        'March': 'Maart',
        'April': 'April',
        'May': 'Mei',
        'June': 'Juni',
        'July': 'Juli',
        'August': 'Augustus',
        'September': 'September',
        'October': 'Oktober',
        'November': 'November',
        'December': 'December',
        'other': '',
      },
    );
    return '$_temp0';
  }
}
