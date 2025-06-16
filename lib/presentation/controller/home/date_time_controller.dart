import 'package:currency_converter/l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateTimeController extends GetxController {
  final Rx<DateTime> _currentDateTime = DateTime.now().obs;

  DateTime get currentDateTime => _currentDateTime.value;

  set currentDateTime(DateTime dateTime) {
    _currentDateTime.value = dateTime;
  }

  String get weekday {
    return AppLocalizations.of(
      Get.context!,
    )!.weekday(DateFormat(DateFormat.WEEKDAY).format(_currentDateTime.value));
  }

  String get month {
    return AppLocalizations.of(
      Get.context!,
    )!.month(DateFormat(DateFormat.MONTH).format(_currentDateTime.value));
  }

  String get day {
    return (DateFormat(DateFormat.DAY).format(_currentDateTime.value));
  }

  String get year {
    return (DateFormat(DateFormat.YEAR).format(_currentDateTime.value));
  }
}
