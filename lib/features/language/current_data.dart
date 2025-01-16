import 'package:flutter/material.dart';
import 'package:qismati/core/database/session.dart';
import 'package:qismati/core/utils/language_helper.dart';

class CurrentDataState {
  var currentLanguage = '';
  var getlocale = const Locale("en");

  CurrentDataState copyWith(
    var currentLanguage,
    var getlocale,
  ) {
    return CurrentDataState()
      ..currentLanguage = currentLanguage ?? this.currentLanguage
      ..getlocale = getlocale ?? this.getlocale;
  }
}

class CurrentData extends StateNotifier<CurrentDataState> {
  CurrentData() : super(CurrentDataState());

  _setState(CurrentDataState newState) {
    state = newState;
  }

  static final provider = StateNotifierProvider<CurrentData, CurrentDataState>(
    (ref) => CurrentData(),
  );

  // CurrentData({this.getlocale = const Locale("en")});

  LanguageHelper languageHelper = LanguageHelper();

  Locale get locale => state.getlocale;

  Future<Locale> __checkLocal() async {
    Session objSession = Session();
    String? local = await objSession.getSession("local");

    if (local == "") {
      return const Locale("fr");
    } else {
      return Locale(local!);
    }
  }

  void changeLocale(String newLocale) {
    languageHelper.convertLangNameToLocale(newLocale);
    _setState(state.copyWith(newLocale, Locale(newLocale)));
  }

  void changeLocaleWithout(String newLocale) {
    Locale convertedLocale;
    convertedLocale = languageHelper.convertLangNameToLocale(newLocale);
    _setState(state.copyWith(newLocale, convertedLocale));
  }

  defineCurrentLanguage(context) {
    String definedCurrentLanguage;

    definedCurrentLanguage = state.currentLanguage;

    return definedCurrentLanguage;
  }
}
