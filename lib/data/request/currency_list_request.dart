import 'package:currency_converter/utils/constants/url_constants.dart';

class CurrencyListRequest {
  final String date;
  final String apiVersion;

  CurrencyListRequest({required this.date, required this.apiVersion});

  String get url {
    return UrlConstants.baseUrl
        .injectDate(date)
        .injectApiVersion(apiVersion)
        .injectEndpoint(UrlConstants.endpointListOfCurrencies);
  }

  String get fallbackUrl {
    return UrlConstants.fallbackUrl
        .injectDate(date)
        .injectApiVersion(apiVersion)
        .injectEndpoint(UrlConstants.endpointListOfCurrencies);
  }
}
