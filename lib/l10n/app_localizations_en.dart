// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get changeThemeColor => 'Change Theme Color';

  @override
  String changeThemeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(
      mode,
      {
        'light': 'Light',
        'dark': 'Dark',
        'other': 'System',
      },
    );
    return 'Switch to $_temp0 Mode';
  }

  @override
  String get changeLanguage => 'Change Language';

  @override
  String get language => 'English';

  @override
  String get en => 'English';

  @override
  String get es => 'Spanish';

  @override
  String get fr => 'French';

  @override
  String get de => 'German';

  @override
  String get it => 'Italian';

  @override
  String get pt => 'Portuguese';

  @override
  String get ru => 'Russian';

  @override
  String get zh => 'Chinese';

  @override
  String get ja => 'Japanese';

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
  String get ar => 'Arabic';

  @override
  String get nl => 'Dutch';

  @override
  String get el => 'Greek';

  @override
  String get id => 'Indonesian';

  @override
  String get ko => 'Korean';

  @override
  String get pl => 'Polish';

  @override
  String get ro => 'Romanian';

  @override
  String get tr => 'Turkish';
}
