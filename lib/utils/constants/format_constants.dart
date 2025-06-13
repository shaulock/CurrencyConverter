import 'package:intl/intl.dart';

class FormatConstants {
  static DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  static DateFormat timeFormat = DateFormat('HH:mm:ss');
  static DateFormat dateTimeFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  static DateFormat dateTimeWithMillisecondsFormat = DateFormat(
    'yyyy-MM-dd HH:mm:ss.SSS',
  );
  static DateFormat dateTimeWithMillisecondsAndTimezoneFormat = DateFormat(
    'yyyy-MM-dd HH:mm:ss.SSS Z',
  );
  static DateFormat dateTimeWithTimezoneFormat = DateFormat(
    'yyyy-MM-dd HH:mm:ss Z',
  );
}
