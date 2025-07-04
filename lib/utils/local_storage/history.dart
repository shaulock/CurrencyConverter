import 'package:currency_converter/utils/local_storage/conversion.dart';
import 'package:hive/hive.dart';

class History {
  static const String _historyKey = 'history';

  List<Conversion> getHistory() {
    final box = Hive.box<Conversion>(_historyKey);
    var last = box.get('last');
    if (last != null) {
      box.delete('last');
    }
    var values = box.values.toList();
    if (last != null) {
      box.put('last', last);
    }
    return values;
  }

  Future<void> addHistory(Conversion conversion) async {
    final box = Hive.box<Conversion>(_historyKey);
    if (!box.containsKey(conversion.conversionKey) && box.length < 20) {
      await box.put(conversion.conversionKey, conversion);
    } else if (box.length >= 20) {
      // If history is full, remove the oldest entry
      final oldestKey = box.get('last')?.conversionKey ?? '';
      if (oldestKey.isEmpty) return;
      await box.delete(oldestKey);
      await box.put(conversion.conversionKey, conversion);
    }
    await box.put('last', conversion);
  }

  Future<void> removeHistory(Conversion conversion) async {
    final box = Hive.box<Conversion>(_historyKey);
    if (box.containsKey(conversion.conversionKey)) {
      await box.delete(conversion.conversionKey);
    }
  }

  Conversion getLastConversion() {
    final box = Hive.box<Conversion>(_historyKey);
    return box.get(
          'last',
          defaultValue: Conversion(fromCurrency: 'USD', toCurrency: 'EUR'),
        )
        as Conversion;
  }

  Future<void> clearHistory() async {
    final box = Hive.box<Conversion>(_historyKey);
    await box.clear();
  }

  bool isInHistory(Conversion conversion) {
    final box = Hive.box<Conversion>(_historyKey);
    return box.containsKey(conversion.conversionKey);
  }

  Future<void> init() async {
    await Hive.openBox<Conversion>(_historyKey);
  }
}
