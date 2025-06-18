import 'package:hive/hive.dart';

part 'conversion.g.dart';

@HiveType(typeId: 0)
class Conversion {
  @HiveField(0)
  final String fromCurrency;
  @HiveField(1)
  final String toCurrency;

  String get conversionKey => '$fromCurrency-$toCurrency';

  Conversion({required this.fromCurrency, required this.toCurrency});

  Conversion.fromJson(Map<String, dynamic> json)
    : fromCurrency = json['fromCurrency'],
      toCurrency = json['toCurrency'];

  Map<String, dynamic> toJson() {
    return {'fromCurrency': fromCurrency, 'toCurrency': toCurrency};
  }

  @override
  String toString() {
    return 'Conversion{fromCurrency: $fromCurrency, toCurrency: $toCurrency, conversionKey: $conversionKey}';
  }
}
