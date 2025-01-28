import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qismati/constants.dart';
import 'package:qismati/core/database/database_helper.dart';
import 'package:qismati/core/utils/form_filed_validations/password_match_validator.dart';
import 'package:qismati/features/auth/models/signup_model.dart';

part 'signup_state.dart';
part 'signup_event.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final DatabaseHelper databaseHelper;
  final Dio dio = Dio();

  SignupBloc({required this.databaseHelper})
      : super(SignupDefault(
          userNameController: TextEditingController(),
          fullNameController: TextEditingController(),
          emailController: TextEditingController(),
          passwordController: TextEditingController(),
          confirmPasswordController: TextEditingController(),
          phoneNumberController: TextEditingController(),
          ageController: TextEditingController(),
          genderController: TextEditingController(),
          heightController: TextEditingController(),
          weightController: TextEditingController(),
          skinColorController: TextEditingController(),
          bodyShapeController: TextEditingController(),
          healthCaseController: TextEditingController(),
          smokingController: TextEditingController(),
          prayerController: TextEditingController(),
          religiousCommitmentController: TextEditingController(),
          maritalStatusController: TextEditingController(),
          marriageTypeController: TextEditingController(),
          childrenController: TextEditingController(),
          educationalQualificationController: TextEditingController(),
          jobCategoryController: TextEditingController(),
          jobController: TextEditingController(),
          monthlyIncomeController: TextEditingController(),
          financialStatusController: TextEditingController(),
          nationalityController: TextEditingController(),
          cityController: TextEditingController(),
          countryController: TextEditingController(),
          aboutYourSelfController: TextEditingController(),
          aboutYourPartnerController: TextEditingController(),
          beardController: TextEditingController(),
          vielController: TextEditingController(),
          longitudeController: TextEditingController(),
          latitudeController: TextEditingController(),
          countryCode: '',
          error: SignupError.none,
        )) {
    on<RegisterUser>(_registerUser);
  }
  FutureOr<void> _registerUser(RegisterUser event, emit) async {
    const String url = "${Constants.baseUrl}/user/profile-setup";

    if (state is SignupDefault) {
      final storedToken = await databaseHelper.getToken();

      final signupState = state as SignupDefault;

      emit(SignupLoading());

      final json = event.signupModel.toJson();

      final sentData = jsonEncode(json);
      final res = await dio.patch(
        url,
        data: sentData,
        options: Options(
          headers: <String, String>{
            "Content-Type": "application/json",
            "Authorization": "Bearer $storedToken",
          },
        ),
      );

      if (res.statusCode == 200) {
        emit(SignupSuccess());
      } else {
        final body = jsonDecode(res.data);
        emit(
          signupState.copyWith(
            error: SignupError.input,
            errorMessage: body["message"],
          ),
        );
      }
    }
  }

  // compare the confrim password with the password field.
  String? validateConfirmPw(String? value) {
    return confirmPasswordValidator(
        value, (state as SignupDefault).passwordController.text);
  }
}
