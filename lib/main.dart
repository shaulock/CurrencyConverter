import 'package:currency_converter/l10n/app_localizations.dart';
import 'package:currency_converter/presentation/page/home/page.dart';
import 'package:currency_converter/utils/constants/constants_base.dart';
import 'package:currency_converter/utils/injections.dart';
import 'package:currency_converter/utils/local_storage/conversion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ConversionAdapter());
  await settings.init();
  await favorites.init();
  await history.init();

  injectControllers();
  runApp(Root());
}

class Root extends StatelessWidget {
  const Root({super.key});
  @override
  Widget build(BuildContext context) {
    String language = settings.getLanguage();
    if (language.isEmpty) {
      language = 'English'; // Default to English if no language is set
      settings.saveLanguage(language);
    }
    return Sizer(
      builder: (context, orientation, screenType) {
        return SafeArea(
          bottom: true,
          top: false,
          child: Obx(
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
              builder: (context, child) {
                return MediaQuery.withNoTextScaling(child: child!);
              },
              title: 'Currency Converter',
              theme: colorController.themeData.value,
              themeMode: colorController.themeMode.value,
              home: HomePage(),
            ),
          ),
        );
      },
    );
  }
}
