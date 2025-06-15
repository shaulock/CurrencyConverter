// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get helloWorld => 'നമസ്കാരം ലോകമേ!';

  @override
  String get changeThemeColor => 'തീം നിറം മാറ്റുക';

  @override
  String changeThemeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(
      mode,
      {
        'light': 'ലൈറ്റ്',
        'dark': 'ഡാർക്ക്',
        'other': 'സിസ്റ്റം',
      },
    );
    return '$_temp0 മോഡിലേക്ക് മാറുക';
  }

  @override
  String get changeLanguage => 'ഭാഷ മാറ്റുക';

  @override
  String get language => 'മലയാളം';

  @override
  String get en => 'ഇംഗ്ലീഷ്';

  @override
  String get es => 'സ്പാനിഷ്';

  @override
  String get fr => 'ഫ്രഞ്ച്';

  @override
  String get de => 'ജർമൻ';

  @override
  String get it => 'ഇറ്റാലിയൻ';

  @override
  String get pt => 'പോർച്ചുഗീസ്';

  @override
  String get ru => 'റഷ്യൻ';

  @override
  String get zh => 'ചൈനീസ്';

  @override
  String get ja => 'ജാപ്പനീസ്';

  @override
  String get hi => 'ഹിന്ദി';

  @override
  String get kn => 'കന്നഡ';

  @override
  String get ta => 'തമിഴ്';

  @override
  String get te => 'തെലുങ്ക്';

  @override
  String get ml => 'മലയാളം';

  @override
  String get ar => 'അറബിക്';

  @override
  String get nl => 'ഡച്ച്';

  @override
  String get el => 'ഗ്രീക്ക്';

  @override
  String get id => 'ഇൻഡോനേഷ്യൻ';

  @override
  String get ko => 'കൊറിയൻ';

  @override
  String get pl => 'പോളിഷ്';

  @override
  String get ro => 'റൊമാനിയൻ';

  @override
  String get tr => 'ടർക്കിഷ്';
}
