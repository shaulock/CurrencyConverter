import 'package:currency_converter/l10n/app_localizations.dart';
import 'package:currency_converter/presentation/page/home/page.dart';
import 'package:currency_converter/utils/constants/constants_base.dart';
import 'package:currency_converter/utils/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injectControllers();
  runApp(Root());
}

class Root extends StatelessWidget {
  const Root({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return Obx(
          () => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              // Use Latin if available for your own translations
              if (locale != null && supportedLocales.contains(locale)) {
                return locale;
              }
              // Fallback to English for built-in widgets
              return const Locale('en');
            },
            title: 'Currency Converter',
            theme: colorController.themeData.value,
            themeMode: colorController.themeMode.value,
            home: HomePage(),
          ),
        );
      },
    );
  }
}
