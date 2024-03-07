import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:farmerapp/pages/home.dart';
import 'package:farmerapp/localization/controller.dart';
import 'package:farmerapp/localization/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LocaleCont());
    return GetBuilder<LocaleCont>(
      builder: (cont) => MaterialApp(
        locale: cont.locale,
        debugShowCheckedModeBanner: false,
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          for (var locale in supportedLocales) {
            if (locale.languageCode == deviceLocale!.languageCode &&
                locale.countryCode == deviceLocale.countryCode) {
              return deviceLocale;
            }
          }
          return supportedLocales.first;
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade200),
          useMaterial3: true,
          textTheme: GoogleFonts.mulishTextTheme(),
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalization.delegate,
        ],
        supportedLocales: const [
          Locale('as', 'AS'), // Assamese
          Locale('bn', 'BA'), // Bangla
          Locale('en', 'US'), // English
          Locale('gu', 'GU'), // Gujarati
          Locale('hi', 'HI'), // Hindi
          Locale('kn', 'KN'), // Kannada
          Locale('ml', 'ML'), // Malayalam
          Locale('mr', 'MR'), // Marathi
          Locale('or', 'OR'), // Odia
          Locale('pa', 'PA'), // Punjabi
          Locale('ta', 'TA'), // Tamil
          Locale('te', 'TE'), // Telugu
          Locale('ur', 'UR'), // Urdu
        ],
        title: 'Team 35UM',
        home: const MyHomePage(username: 'Team 35UM'),
      ),
    );
  }
}
