import 'package:currency_converter/data/request/currency_list_request.dart';
import 'package:currency_converter/domain/repository/fetch_currency_list_repository.dart';
import 'package:currency_converter/utils/responses/currency_list_response.dart';
import 'package:currency_converter/utils/widgets/loader.dart';
import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class FetchCurrencyListRepositoryImpl extends FetchCurrencyListRepository {
  @override
  Future<CurrencyListResponse> fetchCurrencyList(
    CurrencyListRequest request,
  ) async {
    try {
      Dio dio = Dio();
      RxDouble progress = 0.0.obs;
      loader(percentFinished: progress);
      var response = await dio.get(
        request.url,
        onReceiveProgress: (count, total) {
          if (total > 0) {
            progress.value = (count / total) * 100;
          } else {
            progress.value = 100.0;
          }
        },
      );
      if (response.statusCode == 200) {
        return CurrencyListResponse.fromJson(response.data);
      } else {
        throw Exception(
          "Failed to load conversion rates: ${response.statusCode} ${response.statusMessage}",
        );
      }
    } catch (e) {
      throw Exception("Failed to fetch conversion rates: $e");
    }
  }
}
