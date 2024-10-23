import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc()
      : super(
          SignupDefault(
            countryController: TextEditingController(),
            aboutYourPartnerController: TextEditingController(),
            aboutYourSelfController: TextEditingController(),
            ageController: TextEditingController(),
            beardController: TextEditingController(),
            bodyShapeController: TextEditingController(),
            childrenController: TextEditingController(),
            cityController: TextEditingController(),
            confirmPasswordController: TextEditingController(),
            educationQualificationController: TextEditingController(),
            emailController: TextEditingController(),
            financialStatusController: TextEditingController(),
            fullNameController: TextEditingController(),
            healthCaseController: TextEditingController(),
            heightController: TextEditingController(),
            jobCategoryController: TextEditingController(),
            jobController: TextEditingController(),
            maritalStatusController: TextEditingController(),
            marriageTypeController: TextEditingController(),
            montlyIncomeController: TextEditingController(),
            nationalityController: TextEditingController(),
            passwordController: TextEditingController(),
            phoneNumberController: TextEditingController(),
            prayerController: TextEditingController(),
            religiousCommitmentController: TextEditingController(),
            skinColorController: TextEditingController(),
            smokingController: TextEditingController(),
            userNameController: TextEditingController(),
            weightController: TextEditingController(),
            vielController: TextEditingController(),
            err: SignupErr.none,
          ),
        ) {
    on<AttemptSignupAsMan>(_attemptSignupAsMan);
    on<AttemptSignupAsWoman>(_attemptSignupAsWoman);
    // login_bloc.dart
    on<SignupReset>((event, emit) {
      emit(
          SignupDefault(
            countryController: TextEditingController(),
            aboutYourPartnerController: TextEditingController(),
            aboutYourSelfController: TextEditingController(),
            ageController: TextEditingController(),
            beardController: TextEditingController(),
            bodyShapeController: TextEditingController(),
            childrenController: TextEditingController(),
            cityController: TextEditingController(),
            confirmPasswordController: TextEditingController(),
            educationQualificationController: TextEditingController(),
            emailController: TextEditingController(),
            financialStatusController: TextEditingController(),
            fullNameController: TextEditingController(),
            healthCaseController: TextEditingController(),
            heightController: TextEditingController(),
            jobCategoryController: TextEditingController(),
            jobController: TextEditingController(),
            maritalStatusController: TextEditingController(),
            marriageTypeController: TextEditingController(),
            montlyIncomeController: TextEditingController(),
            nationalityController: TextEditingController(),
            passwordController: TextEditingController(),
            phoneNumberController: TextEditingController(),
            prayerController: TextEditingController(),
            religiousCommitmentController: TextEditingController(),
            skinColorController: TextEditingController(),
            smokingController: TextEditingController(),
            userNameController: TextEditingController(),
            weightController: TextEditingController(),
            vielController: TextEditingController(),
            err: SignupErr.none,
          ),
        );
      },
    );
  }

  FutureOr<void> _attemptSignupAsMan(event, emit) async {
    if (state is SignupDefault) {
      final signupState = state as SignupDefault;
      emit(SignupPending());
      try {
        await Future.delayed(const Duration(seconds: 1));
        debugPrint(signupState.countryController.text);
        emit(SignupSuccess());
      } catch (e) {
        emit(signupState.copyWith(err: SignupErr.userNotFound));
      }
    }
  }

  FutureOr<void> _attemptSignupAsWoman(event, emit) async {
    if (state is SignupDefault) {
      final signupState = state as SignupDefault;
      emit(SignupPending());
      try {
        await Future.delayed(const Duration(seconds: 1));
        debugPrint(signupState.countryController.text);
        emit(SignupSuccess());
      } catch (e) {
        emit(signupState.copyWith(err: SignupErr.userNotFound));
      }
    }
  }
}
