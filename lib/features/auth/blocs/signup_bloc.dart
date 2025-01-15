import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qismati/constants.dart';
import 'package:http/http.dart' as http;
import 'package:qismati/core/utils/form_filed_validations/password_match_validator.dart';
import 'package:qismati/features/auth/models/signup_model.dart';

part 'signup_state.dart';
part 'signup_event.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc()
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
          error: SignupError.none,
        )) {
    on<RegisterUser>(_registerUser);
  }
  FutureOr<void> _registerUser(RegisterUser event, emit) async {
    const String url = "${Constants.baseUrl}/auth/signup";
    if (state is SignupDefault) {
      final signupState = state as SignupDefault;

      emit(SignupLoading());
      debugPrint(" [X]Signing up...");

      final json = event.signupModel.toJson(event.gender.toLowerCase());

      debugPrint(" [X]Converted Json: $json");

      final sentData = jsonEncode(json);
      final res = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          "Content-Type": "application/json",
        },
        body: sentData,
      );

      debugPrint("status code: ${res.statusCode}");
      debugPrint("response body: ${res.body}");

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body) as Map<String, dynamic>;
        debugPrint("status code: ${res.statusCode}");
        debugPrint("response body: $body");
        debugPrint("Registering a ${event.gender}");
        emit(SignupSuccess());
      } else {
        debugPrint(
          "Could not register this user, status code:  ${res.statusCode}",
        );

        final body = jsonDecode(res.body) as Map<String, dynamic>;
        emit(
          signupState.copyWith(
            error: SignupError.input,
            errorMessage: body["message"],
          ),
        );
        debugPrint(res.body);
      }
    }
  }

  // compare the confrim password with the password field.
  String? validateConfirmPw(String? value) {
    return confirmPasswordValidator(
        value, (state as SignupDefault).passwordController.text);
  }
}
