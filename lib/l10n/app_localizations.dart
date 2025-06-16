import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('kn'),
    Locale('ko'),
    Locale('ml'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ro'),
    Locale('ru'),
    Locale('ta'),
    Locale('te'),
    Locale('tr'),
    Locale('zh')
  ];

  /// The conventional newborn programmer greeting
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// Text for changing the theme color in the app
  ///
  /// In en, this message translates to:
  /// **'Change Theme Color'**
  String get changeThemeColor;

  /// Text for switching the theme mode in the app, where {mode} is replaced with 'Light', 'Dark', or 'System'
  ///
  /// In en, this message translates to:
  /// **'Switch to {mode, select, light{Light} dark{Dark} other{System}} Mode'**
  String changeThemeMode(String mode);

  /// Text for changing the language in the app
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// The name of the language
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language;

  /// The English language code
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get en;

  /// The Spanish language code
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get es;

  /// The French language code
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get fr;

  /// The German language code
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get de;

  /// The Italian language code
  ///
  /// In en, this message translates to:
  /// **'Italian'**
  String get it;

  /// The Portuguese language code
  ///
  /// In en, this message translates to:
  /// **'Portuguese'**
  String get pt;

  /// The Russian language code
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get ru;

  /// The Chinese language code
  ///
  /// In en, this message translates to:
  /// **'Chinese'**
  String get zh;

  /// The Japanese language code
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get ja;

  /// The Hindi language code
  ///
  /// In en, this message translates to:
  /// **'Hindi'**
  String get hi;

  /// The Kannada language code
  ///
  /// In en, this message translates to:
  /// **'Kannada'**
  String get kn;

  /// The Tamil language code
  ///
  /// In en, this message translates to:
  /// **'Tamil'**
  String get ta;

  /// The Telugu language code
  ///
  /// In en, this message translates to:
  /// **'Telugu'**
  String get te;

  /// The Malayalam language code
  ///
  /// In en, this message translates to:
  /// **'Malayalam'**
  String get ml;

  /// The Arabic language code
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get ar;

  /// The Dutch language code
  ///
  /// In en, this message translates to:
  /// **'Dutch'**
  String get nl;

  /// The Greek language code
  ///
  /// In en, this message translates to:
  /// **'Greek'**
  String get el;

  /// The Indonesian language code
  ///
  /// In en, this message translates to:
  /// **'Indonesian'**
  String get id;

  /// The Korean language code
  ///
  /// In en, this message translates to:
  /// **'Korean'**
  String get ko;

  /// The Polish language code
  ///
  /// In en, this message translates to:
  /// **'Polish'**
  String get pl;

  /// The Romanian language code
  ///
  /// In en, this message translates to:
  /// **'Romanian'**
  String get ro;

  /// The Turkish language code
  ///
  /// In en, this message translates to:
  /// **'Turkish'**
  String get tr;

  /// A placeholder for the day of the week, where {weekday} is replaced with the actual day name
  ///
  /// In en, this message translates to:
  /// **'{weekday, select, Monday{Monday} Tuesday{Tuesday} Wednesday{Wednesday} Thursday{Thursday} Friday{Friday} Saturday{Saturday} Sunday{Sunday} other{}}'**
  String weekday(String weekday);

  /// A placeholder for the month, where {month} is replaced with the actual month name
  ///
  /// In en, this message translates to:
  /// **'{month, select, January{January} February{February} March{March} April{April} May{May} June{June} July{July} August{August} September{September} October{October} November{November} December{December} other{}}'**
  String month(String month);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'de', 'el', 'en', 'es', 'fr', 'hi', 'id', 'it', 'ja', 'kn', 'ko', 'ml', 'nl', 'pl', 'pt', 'ro', 'ru', 'ta', 'te', 'tr', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'de': return AppLocalizationsDe();
    case 'el': return AppLocalizationsEl();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
    case 'hi': return AppLocalizationsHi();
    case 'id': return AppLocalizationsId();
    case 'it': return AppLocalizationsIt();
    case 'ja': return AppLocalizationsJa();
    case 'kn': return AppLocalizationsKn();
    case 'ko': return AppLocalizationsKo();
    case 'ml': return AppLocalizationsMl();
    case 'nl': return AppLocalizationsNl();
    case 'pl': return AppLocalizationsPl();
    case 'pt': return AppLocalizationsPt();
    case 'ro': return AppLocalizationsRo();
    case 'ru': return AppLocalizationsRu();
    case 'ta': return AppLocalizationsTa();
    case 'te': return AppLocalizationsTe();
    case 'tr': return AppLocalizationsTr();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
