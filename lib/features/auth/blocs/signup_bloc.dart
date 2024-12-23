import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qismati/constants.dart';
import 'package:http/http.dart' as http;
import 'package:qismati/features/auth/models/signup_model.dart';

part 'signup_state.dart';
part 'signup_event.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc()
      : super(SignupDefault(
          userNameController: TextEditingController(text: "terraform@1234"),
          fullNameController: TextEditingController(text: "Muhammed Abdella"),
          emailController:
              TextEditingController(text: "muhammed123rus@gmail.com"),
          passwordController: TextEditingController(text: "123456789"),
          confirmPasswordController: TextEditingController(text: "123456789"),
          phoneNumberController: TextEditingController(text: "+251953194211"),
          ageController: TextEditingController(text: "23"),
          genderController: TextEditingController(text: "male"),
          heightController: TextEditingController(text: "183.2"),
          weightController: TextEditingController(text: "78.2"),
          skinColorController: TextEditingController(text: "Black"),
          bodyShapeController: TextEditingController(text: "Dadbod"),
          healthCaseController: TextEditingController(text: "Healthy"),
          smokingController: TextEditingController(text: "Non smoker"),
          prayerController: TextEditingController(text: "prayer"),
          religiousCommitmentController:
              TextEditingController(text: "committed"),
          maritalStatusController: TextEditingController(text: "Not married"),
          marriageTypeController: TextEditingController(text: "Monogamous"),
          childrenController: TextEditingController(text: "2"),
          educationalQualificationController:
              TextEditingController(text: "Bachelor's"),
          jobCategoryController: TextEditingController(text: "Finance"),
          jobController: TextEditingController(text: "Finance Analyst"),
          monthlyIncomeController: TextEditingController(text: "700000"),
          financialStatusController: TextEditingController(text: "Wealthy"),
          nationalityController: TextEditingController(text: "Saudi"),
          cityController: TextEditingController(text: "Riyadh"),
          countryController: TextEditingController(text: "Saudi Arabia"),
          aboutYourSelfController:
              TextEditingController(text: "I am a chill guy"),
          aboutYourPartnerController: TextEditingController(
              text: "Habibi as long as you are for me I will love you"),
          beardController: TextEditingController(text: "Bearded"),
          vielController: TextEditingController(text: "I don't mind"),
          longitudeController: TextEditingController(text: "24.7136"),
          latitudeController: TextEditingController(text: "46.6753"),
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
}
