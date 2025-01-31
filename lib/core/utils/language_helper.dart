import 'package:flutter/material.dart';

class LanguageHelper {
  Locale convertLangNameToLocale(String langNameToConvert) {
    switch (langNameToConvert) {
      case 'English':
        return const Locale('en');
      case 'Arabic':
        return const Locale('ar');
      case 'Amharic':
        return const Locale('am');
      case 'Oromo':
        return const Locale('om');
      case 'Somali':
        return const Locale('so');
      default:
        return const Locale('en');
    }
  }

  String convertLocaleToLangName(String localeToConvert) {
    switch (localeToConvert) {
      case 'en':
        return "English";
      case 'ar':
        return "Arabic";
      case 'am':
        return "Amharic";
      case 'om':
        return "Oromo";
      case 'so':
        return "Somali";
      default:
        return "English";
    }
  }
}
