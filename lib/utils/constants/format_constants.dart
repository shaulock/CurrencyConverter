import 'package:currency_converter/utils/constants/constants_base.dart';
import 'package:intl/intl.dart';

class FormatConstants {
  static DateFormat get dateFormat =>
      DateFormat(languageAndFormatController.selectedDateFormat.value);
  static DateFormat get timeFormat =>
      DateFormat(languageAndFormatController.selectedTimeFormat.value);
}
