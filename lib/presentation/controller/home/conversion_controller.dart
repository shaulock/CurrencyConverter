import 'package:currency_converter/domain/usecase/fetch_conversion_rates_usecase.dart';
import 'package:currency_converter/domain/usecase/fetch_currency_list_usecase.dart';
import 'package:currency_converter/utils/constants/constants_base.dart';
import 'package:currency_converter/utils/widgets/snackbar.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:get/get.dart';

class ConversionController extends GetxController {
  late Rx<Currency> fromCurrency;
  late Rx<Currency> toCurrency;
  late RxDouble fromAmount;
  late RxDouble toAmount;
  late RxBool isLoading;
  late RxDouble rate;

  double get fromAmountDouble => fromAmount.value / 100;
  double get toAmountDouble => toAmount.value / 100;

  @override
  void onInit() {
    super.onInit();
    var lastInHistory = history.getLastConversion();
    fromAmount = 0.0.obs;
    rate = 0.0.obs;
    isLoading = false.obs;
    toAmount = 0.0.obs;
    fromCurrency =
        CurrencyService().findByCode(lastInHistory.fromCurrency)!.obs;
    toCurrency = CurrencyService().findByCode(lastInHistory.toCurrency)!.obs;
    fetchFirst();
  }

  fetchFirst() async {
    await fetchListOfCurrencies();
    await fetchRate();
  }

  Future<void> fetchListOfCurrencies() async {
    isLoading.value = true;
    try {
      supportedCurrencies = await fetchCurrencyList();
    } catch (e) {
      showErrorSnakcbar("Failed to fetch conversion rates: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchRate() async {
    isLoading.value = true;
    try {
      rate.value = await fetchConversionRate(
        fromCurrency: fromCurrency.value.code,
        toCurrency: toCurrency.value.code,
      );
    } catch (e) {
      showErrorSnakcbar("Failed to fetch conversion rates: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> setFromCurrency(Currency currency) async {
    if (toCurrency.value.code == currency.code) {
      toCurrency.value = fromCurrency.value;
      fromCurrency.value = currency;
      toAmount.value = fromAmount.value / rate.value;
      rate.value = 1 / rate.value;
    } else {
      fromCurrency.value = currency;
      await fetchRate();
      fromAmount.value = toAmount.value / rate.value;
    }
  }

  Future<void> setToCurrency(Currency currency) async {
    if (fromCurrency.value.code == currency.code) {
      fromCurrency.value = toCurrency.value;
      toCurrency.value = currency;
      fromAmount.value = toAmount.value * rate.value;
      rate.value = 1 / rate.value;
    } else {
      toCurrency.value = currency;
      await fetchRate();
      toAmount.value = fromAmount.value * rate.value;
    }
  }
}
