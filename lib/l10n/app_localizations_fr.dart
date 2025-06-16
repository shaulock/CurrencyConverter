// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get helloWorld => 'Bonjour le monde!';

  @override
  String get changeThemeColor => 'Changer la couleur du thème';

  @override
  String changeThemeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(
      mode,
      {
        'light': 'clair',
        'dark': 'sombre',
        'other': 'système',
      },
    );
    return 'Passer au thème $_temp0';
  }

  @override
  String get changeLanguage => 'Changer de langue';

  @override
  String get language => 'Français';

  @override
  String get en => 'Anglais';

  @override
  String get es => 'Espagnol';

  @override
  String get fr => 'Français';

  @override
  String get de => 'Allemand';

  @override
  String get it => 'Italien';

  @override
  String get pt => 'Portugais';

  @override
  String get ru => 'Russe';

  @override
  String get zh => 'Chinois';

  @override
  String get ja => 'Japonais';

  @override
  String get hi => 'Hindi';

  @override
  String get kn => 'Kannada';

  @override
  String get ta => 'Tamoul';

  @override
  String get te => 'Télougou';

  @override
  String get ml => 'Malayalam';

  @override
  String get ar => 'Arabe';

  @override
  String get nl => 'Néerlandais';

  @override
  String get el => 'Grec';

  @override
  String get id => 'Indonésien';

  @override
  String get ko => 'Coréen';

  @override
  String get pl => 'Polonais';

  @override
  String get ro => 'Roumain';

  @override
  String get tr => 'Turc';

  @override
  String weekday(String weekday) {
    String _temp0 = intl.Intl.selectLogic(
      weekday,
      {
        'Monday': 'Lundi',
        'Tuesday': 'Mardi',
        'Wednesday': 'Mercredi',
        'Thursday': 'Jeudi',
        'Friday': 'Vendredi',
        'Saturday': 'Samedi',
        'Sunday': 'Dimanche',
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
        'January': 'Janvier',
        'February': 'Février',
        'March': 'Mars',
        'April': 'Avril',
        'May': 'Mai',
        'June': 'Juin',
        'July': 'Juillet',
        'August': 'Août',
        'September': 'Septembre',
        'October': 'Octobre',
        'November': 'Novembre',
        'December': 'Décembre',
        'other': '',
      },
    );
    return '$_temp0';
  }
}
