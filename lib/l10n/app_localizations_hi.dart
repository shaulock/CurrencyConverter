// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get currencyConverter => 'मुद्रा परिवर्तक';

  @override
  String get changeThemeColor => 'रूप रंग बदलें';

  @override
  String changeThemeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(
      mode,
      {
        'light': 'प्रकाश',
        'dark': 'अंधकार',
        'other': 'प्रणाली',
      },
    );
    return '$_temp0 स्थिति चुनें';
  }

  @override
  String get changeLanguage => 'भाषा बदलें';

  @override
  String get language => 'हिंदी';

  @override
  String get en => 'अंग्रेज़ी';

  @override
  String get es => 'स्पेनिश';

  @override
  String get fr => 'फ़्रेंच';

  @override
  String get de => 'जर्मन';

  @override
  String get it => 'इतालवी';

  @override
  String get pt => 'पुर्तगाली';

  @override
  String get ru => 'रूसी';

  @override
  String get zh => 'चीनी';

  @override
  String get ja => 'जापानी';

  @override
  String get hi => 'हिंदी';

  @override
  String get kn => 'कन्नड़';

  @override
  String get ta => 'तमिल';

  @override
  String get te => 'तेलुगु';

  @override
  String get ml => 'मलयालम';

  @override
  String get ar => 'अरबी';

  @override
  String get nl => 'डच';

  @override
  String get el => 'ग्रीक';

  @override
  String get id => 'इंडोनेशियाई';

  @override
  String get ko => 'कोरियाई';

  @override
  String get pl => 'पोलिश';

  @override
  String get ro => 'रोमानियाई';

  @override
  String get tr => 'तुर्की';

  @override
  String weekday(String weekday) {
    String _temp0 = intl.Intl.selectLogic(
      weekday,
      {
        'Monday': 'सोमवार',
        'Tuesday': 'मंगलवार',
        'Wednesday': 'बुधवार',
        'Thursday': 'गुरूवार',
        'Friday': 'शुक्रवार',
        'Saturday': 'शनिवार',
        'Sunday': 'रविवार',
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
        'January': 'जनवरी',
        'February': 'फ़रवरी',
        'March': 'मार्च',
        'April': 'अप्रैल',
        'May': 'मई',
        'June': 'जून',
        'July': 'जुलाई',
        'August': 'अगस्त',
        'September': 'सितंबर',
        'October': 'अक्टूबर',
        'November': 'नवंबर',
        'December': 'दिसंबर',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get favourites => 'पसंदीदा';

  @override
  String get history => 'इतिहास';
}
