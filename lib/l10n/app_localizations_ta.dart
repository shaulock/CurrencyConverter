// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get helloWorld => 'வணக்கம் உலகம்!';

  @override
  String get changeThemeColor => 'தீம் நிறத்தை மாற்று';

  @override
  String changeThemeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(
      mode,
      {
        'light': 'ஒளி',
        'dark': 'இருண்ட',
        'other': 'சிஸ்டம்',
      },
    );
    return '$_temp0 பயன்முறைக்கு மாறவும்';
  }

  @override
  String get changeLanguage => 'மொழியை மாற்று';

  @override
  String get language => 'தமிழ்';

  @override
  String get en => 'ஆங்கிலம்';

  @override
  String get es => 'ஸ்பானிஷ்';

  @override
  String get fr => 'பிரெஞ்சு';

  @override
  String get de => 'ஜெர்மன்';

  @override
  String get it => 'இத்தாலியன்';

  @override
  String get pt => 'போர்ச்சுகீஸ்';

  @override
  String get ru => 'ரஷ்யன்';

  @override
  String get zh => 'சைனீஸ்';

  @override
  String get ja => 'ஜப்பனீஸ்';

  @override
  String get hi => 'ஹிந்தி';

  @override
  String get kn => 'கன்னடம்';

  @override
  String get ta => 'தமிழ்';

  @override
  String get te => 'தெலுங்கு';

  @override
  String get ml => 'மலையாளம்';

  @override
  String get ar => 'அரபு';

  @override
  String get nl => 'டச்சு';

  @override
  String get el => 'கிரேக்கம்';

  @override
  String get id => 'இண்டோனேஷியன்';

  @override
  String get ko => 'கொரியன்';

  @override
  String get pl => 'போலிஷ்';

  @override
  String get ro => 'ரோமானியன்';

  @override
  String get tr => 'துருக்கி';

  @override
  String weekday(String weekday) {
    String _temp0 = intl.Intl.selectLogic(
      weekday,
      {
        'Monday': 'திங்கள்',
        'Tuesday': 'செவ்வாய்',
        'Wednesday': 'புதன்',
        'Thursday': 'வியாழன்',
        'Friday': 'வெள்ளி',
        'Saturday': 'சனி',
        'Sunday': 'ஞாயிறு',
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
        'January': 'ஜனவரி',
        'February': 'பிப்ரவரி',
        'March': 'மார்ச்',
        'April': 'ஏப்ரல்',
        'May': 'மே',
        'June': 'ஜூன்',
        'July': 'ஜூலை',
        'August': 'ஆகஸ்ட்',
        'September': 'செப்டெம்பர்',
        'October': 'அக்டோபர்',
        'November': 'நவம்பர்',
        'December': 'டிசம்பர்',
        'other': '',
      },
    );
    return '$_temp0';
  }
}
