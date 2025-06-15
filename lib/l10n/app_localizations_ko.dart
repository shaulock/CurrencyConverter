// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get helloWorld => '안녕하세요!';

  @override
  String get changeThemeColor => '테마 색상 변경';

  @override
  String changeThemeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(
      mode,
      {
        'light': '밝은',
        'dark': '어두운',
        'other': '시스템',
      },
    );
    return '$_temp0 모드로 전환';
  }

  @override
  String get changeLanguage => '언어 변경';

  @override
  String get language => '한국어';

  @override
  String get en => '영어';

  @override
  String get es => '스페인어';

  @override
  String get fr => '프랑스어';

  @override
  String get de => '독일어';

  @override
  String get it => '이탈리아어';

  @override
  String get pt => '포르투갈어';

  @override
  String get ru => '러시아어';

  @override
  String get zh => '중국어';

  @override
  String get ja => '일본어';

  @override
  String get hi => '힌디어';

  @override
  String get kn => '칸나다어';

  @override
  String get ta => '타밀어';

  @override
  String get te => '텔루구어';

  @override
  String get ml => '말라얄람어';

  @override
  String get ar => '아랍어';

  @override
  String get nl => '네덜란드어';

  @override
  String get el => '그리스어';

  @override
  String get id => '인도네시아어';

  @override
  String get ko => '한국어';

  @override
  String get pl => '폴란드어';

  @override
  String get ro => '루마니아어';

  @override
  String get tr => '터키어';
}
