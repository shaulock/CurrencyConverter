// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get currencyConverter => 'Convertidor de Divisas';

  @override
  String get changeThemeColor => 'Cambiar el color del tema';

  @override
  String changeThemeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(
      mode,
      {
        'light': 'Claro',
        'dark': 'Oscuro',
        'other': 'Sistema',
      },
    );
    return 'Cambiar al modo $_temp0';
  }

  @override
  String get changeLanguage => 'Cambiar idioma';

  @override
  String get language => 'Español';

  @override
  String get en => 'Inglés';

  @override
  String get es => 'Español';

  @override
  String get fr => 'Francés';

  @override
  String get de => 'Alemán';

  @override
  String get it => 'Italiano';

  @override
  String get pt => 'Portugués';

  @override
  String get ru => 'Ruso';

  @override
  String get zh => 'Chino';

  @override
  String get ja => 'Japonés';

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
  String get ar => 'Árabe';

  @override
  String get nl => 'Neerlandés';

  @override
  String get el => 'Griego';

  @override
  String get id => 'Indonesio';

  @override
  String get ko => 'Coreano';

  @override
  String get pl => 'Polaco';

  @override
  String get ro => 'Rumano';

  @override
  String get tr => 'Turco';

  @override
  String weekday(String weekday) {
    String _temp0 = intl.Intl.selectLogic(
      weekday,
      {
        'Monday': 'Lunes',
        'Tuesday': 'Martes',
        'Wednesday': 'Miércoles',
        'Thursday': 'Jueves',
        'Friday': 'Viernes',
        'Saturday': 'Sábado',
        'Sunday': 'Domingo',
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
        'January': 'Enero',
        'February': 'Febrero',
        'March': 'Marzo',
        'April': 'Abril',
        'May': 'Mayo',
        'June': 'Junio',
        'July': 'Julio',
        'August': 'Agosto',
        'September': 'Septiembre',
        'October': 'Octubre',
        'November': 'Noviembre',
        'December': 'Diciembre',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get favourites => 'Favoritos';

  @override
  String get history => 'Historial';
}
