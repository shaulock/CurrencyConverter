// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get helloWorld => 'ನಮಸ್ಕಾರ ವಿಶ್ವವೆ!';

  @override
  String get changeThemeColor => 'ಥೀಮ್ ಮೋಡ್ ಬದಲಾಯಿಸಿ';

  @override
  String changeThemeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(
      mode,
      {
        'light': 'ಲೈಟ್',
        'dark': 'ಡಾರ್ಕ್',
        'other': 'ಸಿಸ್ಟಮ್',
      },
    );
    return '$_temp0 ಮೋಡ್‌ಗೆ ಬದಲಿಸಿ';
  }

  @override
  String get changeLanguage => 'ಭಾಷೆಯನ್ನು ಬದಲಾಯಿಸಿ';

  @override
  String get language => 'ಕನ್ನಡ';

  @override
  String get en => 'ಇಂಗ್ಲಿಷ್';

  @override
  String get es => 'ಸ್ಪ್ಯಾನಿಷ್';

  @override
  String get fr => 'ಫ್ರೆಂಚ್';

  @override
  String get de => 'ಜರ್ಮನ್';

  @override
  String get it => 'ಇಟಾಲಿಯನ್';

  @override
  String get pt => 'ಪೋರ್ಚುಗೀಸ್';

  @override
  String get ru => 'ರಷ್ಯನ್';

  @override
  String get zh => 'ಚೈನೀಸ್';

  @override
  String get ja => 'ಜಪಾನೀಸ್';

  @override
  String get hi => 'ಹಿಂದಿ';

  @override
  String get kn => 'ಕನ್ನಡ';

  @override
  String get ta => 'ತಮಿಳು';

  @override
  String get te => 'ತೆಲುಗು';

  @override
  String get ml => 'ಮಲಯಾಳಂ';

  @override
  String get ar => 'ಅರೇಬಿಕ್';

  @override
  String get nl => 'ಡಚ್';

  @override
  String get el => 'ಗ್ರೀಕ್';

  @override
  String get id => 'ಇಂಡೋನೇಷ್ಯನ್';

  @override
  String get ko => 'ಕೊರಿಯನ್';

  @override
  String get pl => 'ಪೋಲಿಷ್';

  @override
  String get ro => 'ರೊಮೇನಿಯನ್';

  @override
  String get tr => 'ಟರ್ಕಿಷ್';

  @override
  String weekday(String weekday) {
    String _temp0 = intl.Intl.selectLogic(
      weekday,
      {
        'Monday': 'ಸೋಮವಾರ',
        'Tuesday': 'ಮಂಗಳವಾರ',
        'Wednesday': 'ಬುಧವಾರ',
        'Thursday': 'ಗುರುವಾರ',
        'Friday': 'ಶುಕ್ರವಾರ',
        'Saturday': 'ಶನಿವಾರ',
        'Sunday': 'ಭಾನುವಾರ',
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
        'January': 'ಜನವರಿ',
        'February': 'ಫೆಬ್ರವರಿ',
        'March': 'ಮಾರ್ಚ್',
        'April': 'ಏಪ್ರಿಲ್',
        'May': 'ಮೇ',
        'June': 'ಜೂನ್',
        'July': 'ಜುಲೈ',
        'August': 'ಆಗಸ್ಟ್',
        'September': 'ಸೆಪ್ಟೆಂಬರ್',
        'October': 'ಅಕ್ಟೋಬರ್',
        'November': 'ನವೆಂಬರ್',
        'December': 'ಡಿಸೆಂಬರ್',
        'other': '',
      },
    );
    return '$_temp0';
  }
}
