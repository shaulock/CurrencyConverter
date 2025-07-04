import 'dart:math';

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
  late RxInt fromAmount;
  late RxBool fromAmountIsDecimal;
  late RxBool toAmountIsDecimal;
  late RxInt fromAmountDecimalDigits;
  late RxInt toAmountDecimalDigits;
  late RxInt fromAmountDecimalCount;
  late RxInt toAmountDecimalCount;
  late RxInt toAmount;
  late RxBool isLoading;
  late RxDouble rate;
  late RxBool isFavorite;
  late Rx<Conversion> conversion;
  late RxList<Conversion> favourites;
  late RxList<Conversion> histories;

  void fromTyping(int i, int j) {
    if (i < 3) {
      if (fromAmountIsDecimal.value) {
        if (fromAmountDecimalCount.value == 2) {
          return;
        }

        fromAmountDecimalDigits.value =
            (fromAmountDecimalDigits.value * 10) + (i * 3 + (j + 1));
        fromAmountDecimalCount.value += 1;
        return;
      }

      if (fromAmount.value.toString().length == 10) {
        return;
      }

      fromAmount.value = (fromAmount.value * 10) + (i * 3 + (j + 1));
      return;
    }

    if (j == 0) {
      if (fromAmountIsDecimal.value) {
        return;
      }

      fromAmountIsDecimal.value = true;
      fromAmountDecimalCount.value = 0;
      fromAmountDecimalDigits.value = 0;
      return;
    }

    if (j == 1) {
      if (fromAmountIsDecimal.value) {
        if (fromAmountDecimalCount.value != 0) {
          return;
        }

        fromAmountDecimalCount.value += 1;
        return;
      }

      if (fromAmount.value.toString().length == 10) {
        return;
      }

      fromAmount.value *= 10;
      return;
    }

    if (j == 2) {
      if (fromAmountIsDecimal.value) {
        if (fromAmountDecimalCount.value == 0) {
          fromAmountIsDecimal.value = false;
          return;
        }

        fromAmountDecimalDigits.value =
            (fromAmountDecimalDigits.value / 10).floor();
        fromAmountDecimalCount.value -= 1;
        return;
      }

      if (fromAmount.value.toString().isEmpty) {
        return;
      }

      fromAmount.value = (fromAmount.value / 10).floor();
      return;
    }
  }

  void calculateToAmount() {
    double amount =
        ((fromAmountDouble * rate.value) * 100).roundToDouble() / 100;
    int wholePart = amount.truncate();
    int fractPart = (amount * 100).truncate() % 100;
    toAmount.value = wholePart;
    if (fractPart > 0) {
      toAmountIsDecimal.value = true;
      toAmountDecimalDigits.value = fractPart;
      toAmountDecimalCount.value = fractPart % 10 == 0 ? 1 : 2;
      return;
    }
    toAmountIsDecimal.value = false;
    toAmountDecimalDigits.value = 0;
    toAmountDecimalCount.value = 0;
  }

  void calculateFromAmount() {
    double amount = ((toAmountDouble / rate.value) * 100).roundToDouble() / 100;
    int wholePart = amount.truncate();
    int fractPart = (amount * 100).round() % 100;
    fromAmount.value = wholePart;
    if (fractPart > 0) {
      fromAmountIsDecimal.value = true;
      fromAmountDecimalDigits.value = fractPart;
      fromAmountDecimalCount.value = fractPart % 10 == 0 ? 1 : 2;
      return;
    }
    fromAmountIsDecimal.value = false;
    fromAmountDecimalDigits.value = 0;
    fromAmountDecimalCount.value = 0;
  }

  void toTyping(int i, int j) {
    if (i < 3) {
      if (toAmountIsDecimal.value) {
        if (toAmountDecimalCount.value == 2) {
          return;
        }

        toAmountDecimalDigits.value =
            (toAmountDecimalDigits.value * 10) + (i * 3 + (j + 1));
        toAmountDecimalCount.value += 1;
        return;
      }

      if (toAmount.value.toString().length == 10) {
        return;
      }

      toAmount.value = (toAmount.value * 10) + (i * 3 + (j + 1));
      return;
    }

    if (j == 0) {
      if (toAmountIsDecimal.value) {
        return;
      }

      toAmountIsDecimal.value = true;
      toAmountDecimalCount.value = 0;
      toAmountDecimalDigits.value = 0;
      return;
    }

    if (j == 1) {
      if (toAmountIsDecimal.value) {
        if (toAmountDecimalCount.value != 0) {
          return;
        }

        toAmountDecimalCount.value += 1;
        return;
      }

      if (toAmount.value.toString().length == 10) {
        return;
      }

      toAmount.value *= 10;
      return;
    }

    if (j == 2) {
      if (toAmountIsDecimal.value) {
        if (toAmountDecimalCount.value == 0) {
          toAmountIsDecimal.value = false;
          return;
        }

        toAmountDecimalDigits.value =
            (toAmountDecimalDigits.value / 10).floor();
        toAmountDecimalCount.value -= 1;
        return;
      }

      if (toAmount.value.toString().isEmpty) {
        return;
      }

      toAmount.value = (toAmount.value / 10).floor();
      return;
    }
  }

  @override
  void onInit() {
    super.onInit();
    var lastInHistory = history.getLastConversion();
    fromAmount = 0.obs;
    rate = 1.0.obs;
    isLoading = false.obs;
    toAmount = 0.obs;
    fromAmountIsDecimal = false.obs;
    toAmountIsDecimal = false.obs;
    fromAmountDecimalDigits = 0.obs;
    toAmountDecimalDigits = 0.obs;
    fromAmountDecimalCount = 0.obs;
    toAmountDecimalCount = 0.obs;
    fromCurrency =
        CurrencyService().findByCode(lastInHistory.fromCurrency)!.obs;
    toCurrency = CurrencyService().findByCode(lastInHistory.toCurrency)!.obs;
    conversion =
        Conversion(
          fromCurrency: fromCurrency.value.code,
          toCurrency: toCurrency.value.code,
        ).obs;
    isFavorite = isConversionInFavourites().obs;
    histories = history.getHistory().obs;
    favourites = favorites.getFavorites().obs;
    fetchFirst();
    history.addHistory(conversion.value);
    histories.value = history.getHistory();
  }

  double get fromAmountDouble {
    double amount = fromAmount.value.toDouble();
    if (fromAmountIsDecimal.value) {
      amount +=
          fromAmountDecimalDigits.value / pow(10, fromAmountDecimalCount.value);
    }
    amount = amount * 100;
    amount = amount.round().toDouble();
    return amount / 100;
  }

  double get toAmountDouble {
    double amount = toAmount.value.toDouble();
    if (toAmountIsDecimal.value) {
      amount +=
          toAmountDecimalDigits.value / pow(10, toAmountDecimalCount.value);
    }
    amount = amount * 100;
    amount = amount.round().toDouble();
    return amount / 100;
  }

  void swapCurrencies() {
    var temp = fromCurrency.value;
    fromCurrency.value = toCurrency.value;
    toCurrency.value = temp;

    // Swap amounts based on the current rate
    int tempAmount = fromAmount.value;
    fromAmount.value = toAmount.value;
    toAmount.value = tempAmount;

    bool tempIsDecimal = fromAmountIsDecimal.value;
    fromAmountIsDecimal.value = toAmountIsDecimal.value;
    toAmountIsDecimal.value = tempIsDecimal;

    int tempDecimalDigits = fromAmountDecimalDigits.value;
    fromAmountDecimalDigits.value = toAmountDecimalDigits.value;
    toAmountDecimalDigits.value = tempDecimalDigits;

    int tempDecimalCount = fromAmountDecimalCount.value;
    fromAmountDecimalCount.value = toAmountDecimalCount.value;
    toAmountDecimalCount.value = tempDecimalCount;

    rate.value = 1 / rate.value;
    conversion.value = Conversion(
      fromCurrency: fromCurrency.value.code,
      toCurrency: toCurrency.value.code,
    );
    isFavorite.value = isConversionInFavourites();
    history.addHistory(conversion.value);
    histories.value = history.getHistory();
  }

  bool isConversionInFavourites() {
    return favorites.isFavorite(conversion.value) ||
        favorites.isFavorite(
          Conversion(
            fromCurrency: conversion.value.toCurrency,
            toCurrency: conversion.value.fromCurrency,
          ),
        );
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
      swapCurrencies();
    } else {
      fromCurrency.value = currency;
      await fetchRate();
      calculateFromAmount();
    }
    conversion.value = Conversion(
      fromCurrency: fromCurrency.value.code,
      toCurrency: toCurrency.value.code,
    );
    isFavorite.value = isConversionInFavourites();
    await history.addHistory(conversion.value);
    histories.value = history.getHistory();
  }

  Future<void> setToCurrency(Currency currency) async {
    if (fromCurrency.value.code == currency.code) {
      swapCurrencies();
    } else {
      toCurrency.value = currency;
      await fetchRate();
      calculateToAmount();
    }
    conversion.value = Conversion(
      fromCurrency: fromCurrency.value.code,
      toCurrency: toCurrency.value.code,
    );
    isFavorite.value = isConversionInFavourites();
    await history.addHistory(conversion.value);
    histories.value = history.getHistory();
  }
}
