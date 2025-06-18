// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get currencyConverter => '通貨コンバーター';

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

  @override
  String weekday(String weekday) {
    String _temp0 = intl.Intl.selectLogic(
      weekday,
      {
        'Monday': '月曜日',
        'Tuesday': '火曜日',
        'Wednesday': '水曜日',
        'Thursday': '木曜日',
        'Friday': '金曜日',
        'Saturday': '土曜日',
        'Sunday': '日曜日',
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
        'January': '1月',
        'February': '2月',
        'March': '3月',
        'April': '4月',
        'May': '5月',
        'June': '6月',
        'July': '7月',
        'August': '8月',
        'September': '9月',
        'October': '10月',
        'November': '11月',
        'December': '12月',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get favourites => 'お気に入り';

  @override
  String get history => '履歴';
}
