import 'package:currency_converter/utils/constants/url_constants.dart';

class ConversionRatesFromBaseCurrencyRequest {
  final String date;
  final String apiVersion;
  final String baseCurrency;

  ConversionRatesFromBaseCurrencyRequest({
    required this.date,
    required this.apiVersion,
    required this.baseCurrency,
  });

  String get url {
    return UrlConstants.baseUrl
        .injectDate(date)
        .injectApiVersion(apiVersion)
        .injectEndpoint(UrlConstants.endpointAsBaseCurrencyList)
        .injectBaseCurrency(baseCurrency);
  }

  String get fallbackUrl {
    return UrlConstants.fallbackUrl
        .injectDate(date)
        .injectApiVersion(apiVersion)
        .injectEndpoint(UrlConstants.endpointAsBaseCurrencyList)
        .injectBaseCurrency(baseCurrency);
  }
}
