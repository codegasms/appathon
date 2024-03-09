import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A class that handles localization in the app.
class AppLocalization {
  late final Locale _locale;

  /// Constructs an instance of [AppLocalization] with the given locale.
  AppLocalization(this._locale);

  /// Retrieves the [AppLocalization] instance from the given [BuildContext].
  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization)!;
  }

  late Map<String, String> _localizedValues;

  /// Loads the language file based on the current locale.
  Future loadLanguage() async {
    String jsonStringValues =
        await rootBundle.loadString("assets/lang/${_locale.languageCode}.json");
    Map<String, dynamic> mappedValues = json.decode(jsonStringValues);

    _localizedValues =
        mappedValues.map((key, value) => MapEntry(key, value.toString()));
  }

  /// Retrieves the translated value for the given key.
  String? getTranslatedValue(String key) {
    return _localizedValues[key];
  }

  /// The delegate for the [AppLocalization] class.
  static const LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationDelegate();
}

/// A delegate that helps with the localization of the app.
class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return [
      "as",
      "bn",
      "en",
      "gu",
      "hi",
      "kn",
      "ml",
      "mr",
      "or",
      "pa",
      "ta",
      "te",
      "ur"
    ].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization appLocalization = AppLocalization(locale);
    await appLocalization.loadLanguage();
    return appLocalization;
  }

  @override
  bool shouldReload(_AppLocalizationDelegate old) => false;
}
