// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get helloWorld => '「こんにちは世界」';

  @override
  String get changeThemeColor => 'テーマカラーを変更する';

  @override
  String changeThemeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(
      mode,
      {
        'light': 'ライト',
        'dark': 'ダーク',
        'other': 'システム',
      },
    );
    return 'モードに切り替える $_temp0';
  }

  @override
  String get changeLanguage => '言語を変更';

  @override
  String get language => '日本語';

  @override
  String get en => '英語';

  @override
  String get es => 'スペイン語';

  @override
  String get fr => 'フランス語';

  @override
  String get de => 'ドイツ語';

  @override
  String get it => 'イタリア語';

  @override
  String get pt => 'ポルトガル語';

  @override
  String get ru => 'ロシア語';

  @override
  String get zh => '中国語';

  @override
  String get ja => '日本語';

  @override
  String get hi => 'ヒンディー語';

  @override
  String get kn => 'カンナダ語';

  @override
  String get ta => 'タミル語';

  @override
  String get te => 'テルグ語';

  @override
  String get ml => 'マラヤーラム語';

  @override
  String get ar => 'アラビア語';

  @override
  String get nl => 'オランダ語';

  @override
  String get el => 'ギリシャ語';

  @override
  String get id => 'インドネシア語';

  @override
  String get ko => '韓国語';

  @override
  String get pl => 'ポーランド語';

  @override
  String get ro => 'ルーマニア語';

  @override
  String get tr => 'トルコ語';
}
