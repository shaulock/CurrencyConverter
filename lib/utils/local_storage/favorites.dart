import 'package:currency_converter/utils/local_storage/conversion.dart';
import 'package:hive/hive.dart';

class Favorites {
  static const String _favoritesKey = 'favorites';

  List<Conversion> getFavorites() {
    final box = Hive.box<Conversion>(_favoritesKey);
    return box.values.toList();
  }

  Future<void> addFavorite(Conversion conversion) async {
    final box = Hive.box<Conversion>(_favoritesKey);
    if (!box.containsKey(conversion.conversionKey)) {
      await box.put(conversion.conversionKey, conversion);
    }
  }

  Future<void> removeFavorite(Conversion conversion) async {
    final box = Hive.box<Conversion>(_favoritesKey);
    if (box.containsKey(conversion.conversionKey)) {
      await box.delete(conversion.conversionKey);
    }
  }

  Future<void> clearFavorites() async {
    final box = Hive.box<Conversion>(_favoritesKey);
    await box.clear();
  }

  bool isFavorite(Conversion conversion) {
    final box = Hive.box<Conversion>(_favoritesKey);
    return box.containsKey(conversion.conversionKey);
  }

  Future<void> init() async {
    await Hive.openBox<Conversion>(_favoritesKey);
  }
}
