import 'package:currency_converter/data/request/currency_list_request.dart';
import 'package:currency_converter/utils/responses/currency_list_response.dart';

abstract class FetchCurrencyListRepository {
  Future<CurrencyListResponse> fetchCurrencyList(CurrencyListRequest request);
}
