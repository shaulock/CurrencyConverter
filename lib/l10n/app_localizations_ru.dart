// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get currencyConverter => 'Конвертер валют';

  @override
  String get changeThemeColor => 'Изменить цвет темы';

  @override
  String changeThemeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(
      mode,
      {
        'light': 'светлый',
        'dark': 'темный',
        'other': 'системный',
      },
    );
    return 'Переключиться в $_temp0 режим';
  }

  @override
  String get changeLanguage => 'Изменить язык';

  @override
  String get language => 'Русский';

  @override
  String get en => 'Английский';

  @override
  String get es => 'Испанский';

  @override
  String get fr => 'Французский';

  @override
  String get de => 'Немецкий';

  @override
  String get it => 'Итальянский';

  @override
  String get pt => 'Португальский';

  @override
  String get ru => 'Русский';

  @override
  String get zh => 'Китайский';

  @override
  String get ja => 'Японский';

  @override
  String get hi => 'Хинди';

  @override
  String get kn => 'Каннада';

  @override
  String get ta => 'Тамильский';

  @override
  String get te => 'Телугу';

  @override
  String get ml => 'Малаялам';

  @override
  String get ar => 'Арабский';

  @override
  String get nl => 'Голландский';

  @override
  String get el => 'Греческий';

  @override
  String get id => 'Индонезийский';

  @override
  String get ko => 'Корейский';

  @override
  String get pl => 'Польский';

  @override
  String get ro => 'Румынский';

  @override
  String get tr => 'Турецкий';

  @override
  String weekday(String weekday) {
    String _temp0 = intl.Intl.selectLogic(
      weekday,
      {
        'Monday': 'Понедельник',
        'Tuesday': 'Вторник',
        'Wednesday': 'Среда',
        'Thursday': 'Четверг',
        'Friday': 'Пятница',
        'Saturday': 'Суббота',
        'Sunday': 'Воскресенье',
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
        'January': 'Январь',
        'February': 'Февраль',
        'March': 'Март',
        'April': 'Апрель',
        'May': 'Май',
        'June': 'Июнь',
        'July': 'Июль',
        'August': 'Август',
        'September': 'Сентябрь',
        'October': 'Октябрь',
        'November': 'Ноябрь',
        'December': 'Декабрь',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get favourites => 'Избранное';

  @override
  String get history => 'История';
}
