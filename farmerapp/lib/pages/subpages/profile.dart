import 'package:clipboard/clipboard.dart';
import 'package:farmerapp/pages/home.dart';
import 'package:farmerapp/pages/subpages/settings/_common_practices.dart';
import 'package:farmerapp/pages/subpages/settings/other/_tos.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:farmerapp/localization/controller.dart';
import 'package:farmerapp/localization/language.dart';
import 'package:farmerapp/localization/app_localizations.dart';
import 'package:ionicons/ionicons.dart';

import 'settings/_account_screen.dart';
import 'settings/_change_language.dart';
import 'settings/contactus/_contact_us.dart';
import 'settings/faq/_faq.dart';
import 'settings/feedback/_send_feedback.dart';
import 'settings/helper/forward_button.dart';
import 'settings/helper/setting_item.dart';
import 'settings/other/_privacy_policy.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Get.put(LocaleCont());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("user_profile")
                    .toString(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Image.asset("assets/avatar.png", width: 60, height: 60),
                    const SizedBox(width: 20),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Team 35UM",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "IIITS & iLabs Hyderabad Appathon",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    ForwardButton(
                      onTap: () {
                        // print("Button Clicked!!");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditAccountScreen(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("general")
                    .toString(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              SettingItem(
                title: AppLocalization.of(context)
                    .getTranslatedValue("common_practices")
                    .toString(),
                icon: Ionicons.call,
                bgColor: Colors.red.shade100,
                iconColor: Colors.red,
                // value: Language.getLanguageName(
                //     Get.find<LocaleCont>().locale.languageCode),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CommonPractices(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: AppLocalization.of(context)
                    .getTranslatedValue("faq")
                    .toString(),
                icon: Ionicons.analytics,
                bgColor: Colors.red,
                iconColor: Colors.white,
                // value: Language.getLanguageName(
                //     Get.find<LocaleCont>().locale.languageCode),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FAQPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: AppLocalization.of(context)
                    .getTranslatedValue("change_language")
                    .toString(),
                icon: Ionicons.newspaper,
                bgColor: Colors.orange.shade100,
                iconColor: Colors.orange,
                // value: Language.getLanguageName(
                //     Get.find<LocaleCont>().locale.languageCode),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChangeLanguage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("other_settings")
                    .toString(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: AppLocalization.of(context)
                    .getTranslatedValue("contact_us")
                    .toString(),
                icon: Ionicons.mail,
                bgColor: Colors.green,
                iconColor: Colors.white,
                // value: Language.getLanguageName(
                //     Get.find<LocaleCont>().locale.languageCode),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactUsPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: AppLocalization.of(context)
                    .getTranslatedValue("send_feedback")
                    .toString(),
                icon: Ionicons.chatbubble,
                bgColor: Colors.blue.shade100,
                iconColor: Colors.blue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FeedbackForm(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: AppLocalization.of(context)
                    .getTranslatedValue("privacy_policy")
                    .toString(),
                icon: Ionicons.lock_closed,
                bgColor: Colors.grey,
                iconColor: Colors.yellow,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: AppLocalization.of(context)
                    .getTranslatedValue("terms_and_conditions")
                    .toString(),
                icon: Ionicons.document,
                bgColor: Colors.purple,
                iconColor: Colors.white,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TermsAndConditionsPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: AppLocalization.of(context)
                    .getTranslatedValue("logout")
                    .toString(),
                icon: Ionicons.log_out,
                bgColor: Colors.red.shade100,
                iconColor: Colors.red,
                onTap: () {
                  // UserPreferences.reset();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );

//   Locale _changeLanguage(Language language, context) {
//     Locale _a;
//     switch (language.languageCode) {
//       case ASSAMESE:
//         _a = Locale(language.languageCode, 'AS');
//         break;

//       case BENGALI:
//         _a = Locale(language.languageCode, 'BA');
//         break;

//       case ENGLISH:
//         _a = Locale(language.languageCode, "US");
//         break;

//       case GUJARATI:
//         _a = Locale(language.languageCode, "GU");
//         break;

//       case HINDI:
//         _a = Locale(language.languageCode, "HI");
//         break;

//       case KANNADA:
//         _a = Locale(language.languageCode, "KN");
//         break;

//       case MALAYALAM:
//         _a = Locale(language.languageCode, "ML");
//         break;

//       case MARATHI:
//         _a = Locale(language.languageCode, "MR");
//         break;

//       case ODIA:
//         _a = Locale(language.languageCode, "OR");
//         break;

//       case PUNJABI:
//         _a = Locale(language.languageCode, "PA");
//         break;

//       case TAMIL:
//         _a = Locale(language.languageCode, "TA");
//         break;

//       case TELUGU:
//         _a = Locale(language.languageCode, "TE");
//         break;

//       case URDU:
//         _a = Locale(language.languageCode, "UR");
//         break;

//       default:
//         _a = Locale(language.languageCode, 'US');
//     }
//     return _a;

// const String ASSAMESE = "as";
// const String BENGALI = "bn";
// const String ENGLISH = "en";
// const String GUJARATI = "gu";
// const String HINDI = "hi";
// const String KANNADA = "kn";
// const String MALAYALAM = "ml";
// const String MARATHI = "mr";
// const String ODIA = "or";
// const String PUNJABI = "pa";
// const String TAMIL = "ta";
// const String TELUGU = "te";
// const String URDU = "ur";
  }
}
