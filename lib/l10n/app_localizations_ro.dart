// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get helloWorld => 'Salut Lume!';

  @override
  String get changeThemeColor => 'Schimbă culoarea temei';

  @override
  String changeThemeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(
      mode,
      {
        'light': 'luminos',
        'dark': 'întunecat',
        'other': 'sistem',
      },
    );
    return 'Comutare la modul $_temp0';
  }

  @override
  String get changeLanguage => 'Schimbă limba';

  @override
  String get language => 'Română';

  @override
  String get en => 'Engleză';

  @override
  String get es => 'Spaniolă';

  @override
  String get fr => 'Franceză';

  @override
  String get de => 'Germană';

  @override
  String get it => 'Italiană';

  @override
  String get pt => 'Portugheză';

  @override
  String get ru => 'Rusă';

  @override
  String get zh => 'Chineză';

  @override
  String get ja => 'Japoneză';

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
  String get ar => 'Arabă';

  @override
  String get nl => 'Olandeză';

  @override
  String get el => 'Greacă';

  @override
  String get id => 'Indoneziană';

  @override
  String get ko => 'Coreeană';

  @override
  String get pl => 'Poloneză';

  @override
  String get ro => 'Română';

  @override
  String get tr => 'Turcă';

  @override
  String weekday(String weekday) {
    String _temp0 = intl.Intl.selectLogic(
      weekday,
      {
        'Monday': 'Luni',
        'Tuesday': 'Marți',
        'Wednesday': 'Miercuri',
        'Thursday': 'Joi',
        'Friday': 'Vineri',
        'Saturday': 'Sâmbătă',
        'Sunday': 'Duminică',
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
        'January': 'Ianuarie',
        'February': 'Februarie',
        'March': 'Martie',
        'April': 'Aprilie',
        'May': 'Mai',
        'June': 'Iunie',
        'July': 'Iulie',
        'August': 'August',
        'September': 'Septembrie',
        'October': 'Octombrie',
        'November': 'Noiembrie',
        'December': 'Decembrie',
        'other': '',
      },
    );
    return '$_temp0';
  }
}
