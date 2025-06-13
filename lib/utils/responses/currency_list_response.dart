class CurrencyListResponse {
  final Map<String, String> currencies;

  CurrencyListResponse({required this.currencies});
  factory CurrencyListResponse.fromJson(Map<dynamic, dynamic> json) {
    return CurrencyListResponse(currencies: Map<String, String>.from(json));
  }

  Map<String, dynamic> toJson() {
    return {'currencies': currencies};
  }
}
