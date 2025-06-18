// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get currencyConverter => 'Konverter Mata Uang';

  @override
  String get changeThemeColor => 'Ubah Warna Tema';

  @override
  String changeThemeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(
      mode,
      {
        'light': 'Terang',
        'dark': 'Gelap',
        'other': 'Sistem',
      },
    );
    return 'Beralih ke mode $_temp0';
  }

  @override
  String get changeLanguage => 'Ubah Bahasa';

  @override
  String get language => 'Bahasa Indonesia';

  @override
  String get en => 'Inggris';

  @override
  String get es => 'Spanyol';

  @override
  String get fr => 'Prancis';

  @override
  String get de => 'Jerman';

  @override
  String get it => 'Italia';

  @override
  String get pt => 'Portugis';

  @override
  String get ru => 'Rusia';

  @override
  String get zh => 'Cina';

  @override
  String get ja => 'Jepang';

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
  String get ar => 'Arab';

  @override
  String get nl => 'Belanda';

  @override
  String get el => 'Yunani';

  @override
  String get id => 'Bahasa Indonesia';

  @override
  String get ko => 'Korea';

  @override
  String get pl => 'Polandia';

  @override
  String get ro => 'Rumania';

  @override
  String get tr => 'Turki';

  @override
  String weekday(String weekday) {
    String _temp0 = intl.Intl.selectLogic(
      weekday,
      {
        'Monday': 'Senin',
        'Tuesday': 'Selasa',
        'Wednesday': 'Rabu',
        'Thursday': 'Kamis',
        'Friday': 'Jumat',
        'Saturday': 'Sabtu',
        'Sunday': 'Minggu',
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
        'March': 'Maret',
        'April': 'April',
        'May': 'Mei',
        'June': 'Juni',
        'July': 'Juli',
        'August': 'Agustus',
        'September': 'September',
        'October': 'Oktober',
        'November': 'November',
        'December': 'Desember',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get favourites => 'Favorit';

  @override
  String get history => 'Riwayat';
}
