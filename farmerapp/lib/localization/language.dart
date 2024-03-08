import 'package:get/get.dart';

class Language {
  final String name;
  final String flag;
  final String languageCode;

  Language(this.name, this.flag, this.languageCode);

  static List<Language> languageList() {
    return [
      Language("অসমীয়া", "AS", "as"), // Assamese
      Language("বাংলা", "BN", "bn"), // Bangla
      Language("English", "US", "en"), // English
      Language("ગુજરાતી", "GU", "gu"), // Gujarati
      Language("हिन्दी", "HI", "hi"), // Hindi
      Language("ಕನ್ನಡ", "KN", "kn"), // Kannada
      Language("മലയാളം", "ML", "ml"), // Malayalam
      Language("मराठी", "MR", "mr"), // Marathi
      Language("ଓଡ଼ିଆ", "OR", "or"), // Odia
      Language("ਪੰਜਾਬੀ", "PA", "pa"), // Punjabi
      Language("தமிழ்", "TA", "ta"), // Tamil
      Language("తెలుగు", "TE", "te"), // Telugu
      Language("اردو", "UR", "ur"), // Urdu
    ];
  }

  static Language getLanguageType(String name) {
    for (Language language in languageList()) {
      if (language.name == name) {
        return language;
      }
    }

    return languageList()[2];
  }

  static String getLanguageName(String languageCode) {
    for (Language language in languageList()) {
      if (language.languageCode == languageCode) {
        return language.name;
      }
    }

    return languageList()[2].name;
  }
}
