import 'package:currency_converter/data/request/conversion_rates_from_base_currency_request.dart';

abstract class FetchConversionRatesRepository {
  Future<double> fetchConversionRate(
    ConversionRatesFromBaseCurrencyRequest request,
  );
}
