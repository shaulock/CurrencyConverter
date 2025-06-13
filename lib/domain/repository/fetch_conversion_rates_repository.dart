import 'package:currency_converter/data/request/conversion_rates_from_base_currency_request.dart';
import 'package:currency_converter/utils/responses/conversion_rates_from_base_currency.dart';

abstract class FetchConversionRatesRepository {
  Future<ConversionRatesFromBaseCurrency> fetchConversionRates(
    ConversionRatesFromBaseCurrencyRequest request,
  );
}
