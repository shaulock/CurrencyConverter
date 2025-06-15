// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get helloWorld => 'Olá, mundo!';

  @override
  String get changeThemeColor => 'Alterar cor do tema';

  @override
  String changeThemeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(
      mode,
      {
        'light': 'Light',
        'dark': 'Escuro',
        'other': 'Sistema',
      },
    );
    return 'Mudar para o modo $_temp0';
  }

  @override
  String get changeLanguage => 'Alterar idioma';

  @override
  String get language => 'Português';

  @override
  String get en => 'Inglês';

  @override
  String get es => 'Espanhol';

  @override
  String get fr => 'Francês';

  @override
  String get de => 'Alemão';

  @override
  String get it => 'Italiano';

  @override
  String get pt => 'Português';

  @override
  String get ru => 'Russo';

  @override
  String get zh => 'Chinês';

  @override
  String get ja => 'Japonês';

  @override
  String get hi => 'Hindi';

  @override
  String get kn => 'Canarês';

  @override
  String get ta => 'Tâmil';

  @override
  String get te => 'Telugu';

  @override
  String get ml => 'Malaiala';

  @override
  String get ar => 'Árabe';

  @override
  String get nl => 'Holandês';

  @override
  String get el => 'Grego';

  @override
  String get id => 'Indonésio';

  @override
  String get ko => 'Coreano';

  @override
  String get pl => 'Polonês';

  @override
  String get ro => 'Romeno';

  @override
  String get tr => 'Turco';
}
