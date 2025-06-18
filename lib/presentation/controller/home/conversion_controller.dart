import 'package:currency_converter/domain/usecase/fetch_conversion_rates_usecase.dart';
import 'package:currency_converter/domain/usecase/fetch_currency_list_usecase.dart';
import 'package:currency_converter/utils/constants/constants_base.dart';
import 'package:currency_converter/utils/local_storage/conversion.dart';
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
  late RxBool isFavorite;
  late Rx<Conversion> conversion;
  late RxList<Conversion> favourites;
  late RxList<Conversion> histories;

  double get fromAmountDouble => fromAmount.value / 100;
  double get toAmountDouble => toAmount.value / 100;

  void swapCurrencies() {
    var temp = fromCurrency.value;
    fromCurrency.value = toCurrency.value;
    toCurrency.value = temp;

    // Swap amounts based on the current rate
    double tempAmount = fromAmount.value;
    fromAmount.value = toAmount.value;
    toAmount.value = tempAmount;
  }

  bool isConversionInFavourites() {
    return favorites.isFavorite(conversion.value);
  }

  void addFavorite() async {
    isFavorite.value = true;
    await favorites.addFavorite(conversion.value);
    favourites.value = favorites.getFavorites();
  }

  void removeFavoriteFromConversion(Conversion conversion) async {
    await favorites.removeFavorite(conversion);
    isFavorite.value = isConversionInFavourites();
  }

  void removeFavorite() async {
    isFavorite.value = false;
    await favorites.removeFavorite(conversion.value);
    favourites.value = favorites.getFavorites();
  }

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
    if (fromCurrency.value.code.compareTo(toCurrency.value.code) < 0) {
      conversion =
          Conversion(
            fromCurrency: fromCurrency.value.code,
            toCurrency: toCurrency.value.code,
          ).obs;
    } else {
      conversion =
          Conversion(
            fromCurrency: toCurrency.value.code,
            toCurrency: fromCurrency.value.code,
          ).obs;
    }
    isFavorite = isConversionInFavourites().obs;
    histories = history.getHistory().obs;
    favourites = favorites.getFavorites().obs;
    fetchFirst();
    history.addHistory(conversion.value);
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
    if (fromCurrency.value.code.compareTo(toCurrency.value.code) < 0) {
      conversion.value = Conversion(
        fromCurrency: fromCurrency.value.code,
        toCurrency: toCurrency.value.code,
      );
    } else {
      conversion.value = Conversion(
        fromCurrency: toCurrency.value.code,
        toCurrency: fromCurrency.value.code,
      );
    }
    isFavorite.value = isConversionInFavourites();
    await history.addHistory(conversion.value);
    histories.value = history.getHistory();
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
    if (fromCurrency.value.code.compareTo(toCurrency.value.code) < 0) {
      conversion.value = Conversion(
        fromCurrency: fromCurrency.value.code,
        toCurrency: toCurrency.value.code,
      );
    } else {
      conversion.value = Conversion(
        fromCurrency: toCurrency.value.code,
        toCurrency: fromCurrency.value.code,
      );
    }
    isFavorite.value = isConversionInFavourites();
    await history.addHistory(conversion.value);
    histories.value = history.getHistory();
  }
}
