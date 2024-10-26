import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    on<SignupReset>(
      (event, emit) {
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
        // if user is not logged in, first signup
        if (FirebaseAuth.instance.currentUser == null) {
          debugPrint(
              'User is not logged in, trying to signup with email ${signupState.emailController.text} and password ${signupState.passwordController.text}');
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: signupState.emailController.text,
            password: signupState.passwordController.text,
          );
          debugPrint('User signed up successfully');
        }

        var userProfile = {
          'fullName': signupState.fullNameController.text,
          'userName': signupState.userNameController.text,
          'email': signupState.emailController.text,
          'phoneNumber': signupState.phoneNumberController.text,
          'age': signupState.ageController.text,
          'gender': 'male',
          'height': signupState.heightController.text,
          'weight': signupState.weightController.text,
          'skinColor': signupState.skinColorController.text,
          'bodyShape': signupState.bodyShapeController.text,
          'healthCase': signupState.healthCaseController.text,
          'smoking': signupState.smokingController.text,
          'prayer': signupState.prayerController.text,
          'religiousCommitment': signupState.religiousCommitmentController.text,
          'maritalStatus': signupState.maritalStatusController.text,
          'marriageType': signupState.marriageTypeController.text,
          'children': signupState.childrenController.text,
          'educationQualification':
              signupState.educationQualificationController.text,
          'jobCategory': signupState.jobCategoryController.text,
          'job': signupState.jobController.text,
          'montlyIncome': signupState.montlyIncomeController.text,
          'financialStatus': signupState.financialStatusController.text,
          'nationality': signupState.nationalityController.text,
          'city': signupState.cityController.text,
          'country': signupState.countryController.text,
          'aboutYourSelf': signupState.aboutYourSelfController.text,
          'aboutYourPartner': signupState.aboutYourPartnerController.text,
          'beard': signupState.beardController.text,
        };

        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .set(userProfile);
        debugPrint('User profile created successfully');

        emit(SignupSuccess());
      } on FirebaseException catch (e) {
        final SignupErr error = _mapErrorCodeToSignupErr(e.code);
        emit(signupState.copyWith(err: error, errorMessage: e.message));
      }
    }
  }

  FutureOr<void> _attemptSignupAsWoman(event, emit) async {
    if (state is SignupDefault) {
      final signupState = state as SignupDefault;
      emit(SignupPending());
      try {
        // if user is not logged in, first signup
        if (FirebaseAuth.instance.currentUser == null) {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: signupState.emailController.text,
            password: signupState.passwordController.text,
          );
        }

        var userProfile = {
          'fullName': signupState.fullNameController.text,
          'userName': signupState.userNameController.text,
          'email': signupState.emailController.text,
          'phoneNumber': signupState.phoneNumberController.text,
          'age': signupState.ageController.text,
          'gender': 'male',
          'height': signupState.heightController.text,
          'weight': signupState.weightController.text,
          'skinColor': signupState.skinColorController.text,
          'bodyShape': signupState.bodyShapeController.text,
          'healthCase': signupState.healthCaseController.text,
          'smoking': signupState.smokingController.text,
          'prayer': signupState.prayerController.text,
          'religiousCommitment': signupState.religiousCommitmentController.text,
          'maritalStatus': signupState.maritalStatusController.text,
          'marriageType': signupState.marriageTypeController.text,
          'children': signupState.childrenController.text,
          'educationQualification':
              signupState.educationQualificationController.text,
          'jobCategory': signupState.jobCategoryController.text,
          'job': signupState.jobController.text,
          'montlyIncome': signupState.montlyIncomeController.text,
          'financialStatus': signupState.financialStatusController.text,
          'nationality': signupState.nationalityController.text,
          'city': signupState.cityController.text,
          'country': signupState.countryController.text,
          'aboutYourSelf': signupState.aboutYourSelfController.text,
          'aboutYourPartner': signupState.aboutYourPartnerController.text,
          'viel': signupState.vielController.text,
        };

        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .set(userProfile);

        emit(SignupSuccess());
      } on FirebaseException catch (e) {
        final SignupErr error = _mapErrorCodeToSignupErr(e.code);
        emit(signupState.copyWith(err: error, errorMessage: e.message));
      }
    }
  }

  SignupErr _mapErrorCodeToSignupErr(String code) {
    switch (code) {
      case 'user-not-found':
        return SignupErr.userNotFound;
      case 'wrong-password':
        return SignupErr.input;
      default:
        return SignupErr.network;
    }
  }
}
