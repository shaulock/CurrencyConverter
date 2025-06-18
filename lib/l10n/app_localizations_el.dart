// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get currencyConverter => 'Μετατροπέας νομισμάτων';

  @override
  String get changeThemeColor => 'Αλλαγή χρώματος θέματος';

  @override
  String changeThemeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(
      mode,
      {
        'light': 'Φωτεινού',
        'dark': 'Σκότους',
        'other': 'Συστήματος',
      },
    );
    return 'Μετάβαση σε λειτουργία $_temp0';
  }

  @override
  String get changeLanguage => 'Αλλαγή γλώσσας';

  @override
  String get language => 'Ελληνικά';

  @override
  String get en => 'Αγγλικά';

  @override
  String get es => 'Ισπανικά';

  @override
  String get fr => 'Γαλλικά';

  @override
  String get de => 'Γερμανικά';

  @override
  String get it => 'Ιταλικά';

  @override
  String get pt => 'Πορτογαλικά';

  @override
  String get ru => 'Ρωσικά';

  @override
  String get zh => 'Κινεζικά';

  @override
  String get ja => 'Ιαπωνικά';

  @override
  String get hi => 'Χίντι';

  @override
  String get kn => 'Κανάντα';

  @override
  String get ta => 'Ταμίλ';

  @override
  String get te => 'Τελούγκου';

  @override
  String get ml => 'Μαλαγιαλάμ';

  @override
  String get ar => 'Αραβικά';

  @override
  String get nl => 'Ολλανδικά';

  @override
  String get el => 'Ελληνικά';

  @override
  String get id => 'Ινδονησιακά';

  @override
  String get ko => 'Κορεατικά';

  @override
  String get pl => 'Πολωνικά';

  @override
  String get ro => 'Ρουμανικά';

  @override
  String get tr => 'Τουρκικά';

  @override
  String weekday(String weekday) {
    String _temp0 = intl.Intl.selectLogic(
      weekday,
      {
        'Monday': 'Δευτέρα',
        'Tuesday': 'Τρίτη',
        'Wednesday': 'Τετάρτη',
        'Thursday': 'Πέμπτη',
        'Friday': 'Παρασκευή',
        'Saturday': 'Σάββατο',
        'Sunday': 'Κυριακή',
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
        'January': 'Ιανουάριος',
        'February': 'Φεβρουάριος',
        'March': 'Μάρτιος',
        'April': 'Απρίλιος',
        'May': 'Μάιος',
        'June': 'Ιούνιος',
        'July': 'Ιούλιος',
        'August': 'Αύγουστος',
        'September': 'Σεπτέμβριος',
        'October': 'Οκτώβριος',
        'November': 'Νοέμβριος',
        'December': 'Δεκέμβριος',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get favourites => 'Αγαπημένα';

  @override
  String get history => 'Ιστορικό';
}
