import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:farmerapp/localization/controller.dart';
import 'package:farmerapp/localization/language.dart';
import 'package:farmerapp/localization/app_localizations.dart';
import 'package:ionicons/ionicons.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  var selectedLanguage = Language.languageList()[2].name;

  @override
  Widget build(BuildContext context) {
    Get.put(LocaleCont());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Ionicons.chevron_back_outline),
        ),
        leadingWidth: 60,
        title: Text(
          AppLocalization.of(context)
              .getTranslatedValue("change_language")
              .toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  AppLocalization.of(context)
                      .getTranslatedValue("current_langauge")
                      .toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                    Language.getLanguageName(
                        Get.find<LocaleCont>().locale.languageCode),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 3),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  AppLocalization.of(context)
                      .getTranslatedValue("select_language")
                      .toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
                const SizedBox(
                  width: 10,
                ),
                DropdownButton<String>(
                  value: Language.getLanguageName(
                      Get.find<LocaleCont>().locale.languageCode),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedLanguage = newValue!;
                      Get.find<LocaleCont>().updateLocale(_changeLanguage(
                          Language.getLanguageType(newValue), context));
                    });
                    // print(selectedLanguage);
                  },
                  items: Language.languageList()
                      .map((e) => e.name)
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Locale _changeLanguage(Language language, context) {
    Locale _a;
    switch (language.languageCode) {
      case ASSAMESE:
        _a = Locale(language.languageCode, 'AS');
        break;

      case BENGALI:
        _a = Locale(language.languageCode, 'BA');
        break;

      case ENGLISH:
        _a = Locale(language.languageCode, "US");
        break;

      case GUJARATI:
        _a = Locale(language.languageCode, "GU");
        break;

      case HINDI:
        _a = Locale(language.languageCode, "HI");
        break;

      case KANNADA:
        _a = Locale(language.languageCode, "KN");
        break;

      case MALAYALAM:
        _a = Locale(language.languageCode, "ML");
        break;

      case MARATHI:
        _a = Locale(language.languageCode, "MR");
        break;

      case ODIA:
        _a = Locale(language.languageCode, "OR");
        break;

      case PUNJABI:
        _a = Locale(language.languageCode, "PA");
        break;

      case TAMIL:
        _a = Locale(language.languageCode, "TA");
        break;

      case TELUGU:
        _a = Locale(language.languageCode, "TE");
        break;

      case URDU:
        _a = Locale(language.languageCode, "UR");
        break;

      default:
        _a = Locale(language.languageCode, 'US');
    }
    return _a;
  }
}

const String ASSAMESE = "as";
const String BENGALI = "bn";
const String ENGLISH = "en";
const String GUJARATI = "gu";
const String HINDI = "hi";
const String KANNADA = "kn";
const String MALAYALAM = "ml";
const String MARATHI = "mr";
const String ODIA = "or";
const String PUNJABI = "pa";
const String TAMIL = "ta";
const String TELUGU = "te";
const String URDU = "ur";
