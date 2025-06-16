import 'package:intl/intl.dart';

class ConversionRatesFromBaseCurrency {
  String baseCurrency;
  Map<String, double> multiplicationRates;
  DateTime dateOfRates;

  ConversionRatesFromBaseCurrency({
    required this.baseCurrency,
    required this.multiplicationRates,
    required this.dateOfRates,
  });

  factory ConversionRatesFromBaseCurrency.fromJson(Map<dynamic, dynamic> json) {
    return ConversionRatesFromBaseCurrency(
      baseCurrency: json.keys.reduce(
        (value, element) => value == 'date' ? element : value,
      ),
      multiplicationRates: Map<String, double>.from(
        json[json.keys.reduce(
          (value, element) => value == 'date' ? element : value,
        )],
      ),
      dateOfRates: DateFormat('yyyy-MM-dd').parse(json['date'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'base_currency': baseCurrency,
      'multiplication_rates': multiplicationRates,
      'date_of_rates': DateFormat('yyyy-MM-dd').format(dateOfRates),
    };
  }
}
