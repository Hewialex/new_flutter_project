import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qismati/core/database/session.dart';
import 'package:qismati/core/utils/language_helper.dart';

class CurrentDataState {
  final String currentLanguage;
  final Locale locale;

  CurrentDataState({
    this.currentLanguage = 'English',
    this.locale = const Locale('en'),
  });

  CurrentDataState copyWith({
    String? currentLanguage,
    Locale? locale,
  }) {
    return CurrentDataState(
      currentLanguage: currentLanguage ?? this.currentLanguage,
      locale: locale ?? this.locale,
    );
  }
}

class CurrentDataCubit extends Cubit<CurrentDataState> {
  CurrentDataCubit() : super(CurrentDataState());

  final LanguageHelper languageHelper = LanguageHelper();

  void changeLocale(String langCode) {
    emit(
      state.copyWith(
        currentLanguage: languageHelper.convertLocaleToLangName(langCode),
        locale: Locale(langCode),
      ),
    );
  }

  Future<void> checkLocal() async {
    Session objSession = Session();
    String? local = await objSession.getSession("local");

    if (local == "") {
      emit(state.copyWith(locale: const Locale("fr")));
    } else {
      emit(state.copyWith(locale: Locale(local!)));
    }
  }

  String defineCurrentLanguage(BuildContext context) {
    return state.currentLanguage;
  }
}
