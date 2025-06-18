import 'package:currency_converter/data/request/conversion_rates_from_base_currency_request.dart';
import 'package:currency_converter/domain/repository/fetch_conversion_rates_repository.dart';
import 'package:currency_converter_pro/currency_converter_pro.dart';

class FetchConversionRatesRepositoryImpl
    extends FetchConversionRatesRepository {
  @override
  Future<double> fetchConversionRate(
    ConversionRatesFromBaseCurrencyRequest request,
  ) async {
    try {
      var res = await CurrencyConverterPro().fetchExchangeRate(
        fromCurrency: request.fromCurrency.toLowerCase(),
        toCurrency: request.toCurrency.toLowerCase(),
      );
      return res;
    } catch (e) {
      throw Exception("Failed to fetch conversion rates: $e");
    }
  }
}
