import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// The controller class for managing the app's localization.
class LocaleCont extends GetxController {
  Locale locale = const Locale('en', "US");

  /// Updates the current locale with the provided [a] locale.
  void updateLocale(Locale a) {
    locale = a;
    update();
  }
}
