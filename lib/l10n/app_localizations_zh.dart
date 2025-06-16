// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get helloWorld => '你好世界!';

  @override
  String get changeThemeColor => '更改主题颜色';

  @override
  String changeThemeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(
      mode,
      {
        'light': '亮色',
        'dark': '暗色',
        'other': '系统',
      },
    );
    return '切换到$_temp0模式';
  }

  @override
  String get changeLanguage => '更改语言';

  @override
  String get language => '中文';

  @override
  String get en => '英语';

  @override
  String get es => '西班牙语';

  @override
  String get fr => '法语';

  @override
  String get de => '德语';

  @override
  String get it => '意大利语';

  @override
  String get pt => '葡萄牙语';

  @override
  String get ru => '俄语';

  @override
  String get zh => '中文';

  @override
  String get ja => '日语';

  @override
  String get hi => '印地语';

  @override
  String get kn => '卡纳达语';

  @override
  String get ta => '泰米尔语';

  @override
  String get te => '泰卢固语';

  @override
  String get ml => '马拉雅拉姆语';

  @override
  String get ar => '阿拉伯语';

  @override
  String get nl => '荷兰语';

  @override
  String get el => '希腊语';

  @override
  String get id => '印尼语';

  @override
  String get ko => '韩语';

  @override
  String get pl => '波兰语';

  @override
  String get ro => '罗马尼亚语';

  @override
  String get tr => '土耳其语';

  @override
  String weekday(String weekday) {
    String _temp0 = intl.Intl.selectLogic(
      weekday,
      {
        'Monday': '星期一',
        'Tuesday': '星期二',
        'Wednesday': '星期三',
        'Thursday': '星期四',
        'Friday': '星期五',
        'Saturday': '星期六',
        'Sunday': '星期日',
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
        'January': '一月',
        'February': '二月',
        'March': '三月',
        'April': '四月',
        'May': '五月',
        'June': '六月',
        'July': '七月',
        'August': '八月',
        'September': '九月',
        'October': '十月',
        'November': '十一月',
        'December': '十二月',
        'other': '',
      },
    );
    return '$_temp0';
  }
}
