class UrlConstants {
  static const String baseUrl =
      "https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@{date}/{apiVersion}/{endpoint}.min.json";
  static const String fallbackUrl =
      "https://{date}.currency-api.pages.dev/{apiVersion}/{endpoint}.min.json";

  static const String apiVersion = "v1";
  static const String dateNow = "latest";
  static const endpointListOfCurrencies = "currencies";
  static const endpointAsBaseCurrencyList = "currencies/{baseCurrency}";
}

extension InjectIntoUrl on String {
  String injectDate(String date) {
    return replaceAll("{date}", date);
  }

  String injectApiVersion(String apiVersion) {
    return replaceAll("{apiVersion}", apiVersion);
  }

  String injectEndpoint(String endpoint) {
    return replaceAll("{endpoint}", endpoint);
  }

  String injectBaseCurrency(String baseCurrency) {
    return replaceAll("{baseCurrency}", baseCurrency);
  }
}
