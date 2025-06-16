// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get helloWorld => 'నమస్తే ప్రపంచం!';

  @override
  String get changeThemeColor => 'థీమ్ రంగు మార్చండి';

  @override
  String changeThemeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(
      mode,
      {
        'light': 'లైట్',
        'dark': 'డార్క్',
        'other': 'సిస్టమ్',
      },
    );
    return '$_temp0 మోడ్‌కి మారండి';
  }

  @override
  String get changeLanguage => 'భాషను మార్చండి';

  @override
  String get language => 'తెలుగు';

  @override
  String get en => 'ఇంగ్లీష్';

  @override
  String get es => 'స్పానిష్';

  @override
  String get fr => 'ఫ్రెంచ్';

  @override
  String get de => 'జర్మన్';

  @override
  String get it => 'ఇటాలియన్';

  @override
  String get pt => 'పోర్చుగీస్';

  @override
  String get ru => 'రష్యన్';

  @override
  String get zh => 'చైనీస్';

  @override
  String get ja => 'జపనీస్';

  @override
  String get hi => 'హిందీ';

  @override
  String get kn => 'కన్నడ';

  @override
  String get ta => 'తమిళ్';

  @override
  String get te => 'తెలుగు';

  @override
  String get ml => 'మలయాళం';

  @override
  String get ar => 'అరబిక్';

  @override
  String get nl => 'డచ్';

  @override
  String get el => 'గ్రీక్';

  @override
  String get id => 'ఇండోనేషియన్';

  @override
  String get ko => 'కొరియన్';

  @override
  String get pl => 'పోలిష్';

  @override
  String get ro => 'రొమేనియన్';

  @override
  String get tr => 'టర్కిష్';

  @override
  String weekday(String weekday) {
    String _temp0 = intl.Intl.selectLogic(
      weekday,
      {
        'Monday': 'సోమవారం',
        'Tuesday': 'మంగళవారం',
        'Wednesday': 'బుధవారం',
        'Thursday': 'గురువారం',
        'Friday': 'శుక్రవారం',
        'Saturday': 'శనివారం',
        'Sunday': 'ఆదివారం',
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
        'January': 'జనవరి',
        'February': 'ఫిబ్రవరి',
        'March': 'మార్చి',
        'April': 'ఏప్రిల్',
        'May': 'మే',
        'June': 'జూన్',
        'July': 'జూలై',
        'August': 'ఆగస్టు',
        'September': 'సెప్టెంబర్',
        'October': 'అక్టోబర్',
        'November': 'నవంబర్',
        'December': 'డిసెంబర్',
        'other': '',
      },
    );
    return '$_temp0';
  }
}
