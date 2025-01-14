import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/widgets/custom_button.dart';
import 'package:qismati/common/widgets/custom_snackbar.dart';
import 'package:qismati/common/widgets/custom_top_bar.dart';
import 'package:qismati/core/database/database_helper.dart';
import 'package:qismati/features/auth/blocs/signup_bloc.dart';
import 'package:qismati/features/auth/models/signup_model.dart';
import 'package:qismati/features/signup/sections/about_your_partner_section.dart';
import 'package:qismati/features/signup/sections/address_section.dart';
import 'package:qismati/features/signup/sections/education_and_work_section.dart';
import 'package:qismati/features/signup/sections/looks_section.dart';
import 'package:qismati/features/signup/sections/maritial_section.dart';
import 'package:qismati/features/signup/sections/religion_section.dart';
import 'package:qismati/features/signup/sections/talk_about_your_self_section.dart';
import 'package:qismati/features/signup/widgets/list_dot_item.dart';
import 'package:qismati/routes.dart';

class SignupAfterEmailVerificationScreen extends StatelessWidget {
  const SignupAfterEmailVerificationScreen({
    super.key,
    required this.gender,
  });
  final String gender;

  SignupModel convertToSignupModel(SignupDefault state) {
    return SignupModel(
        userName: state.userNameController.text,
        fullName: state.fullNameController.text,
        email: state.emailController.text,
        password: state.passwordController.text,
        phoneNumber: state.phoneNumberController.text,
        // age: int.parse(state.ageController.text),
        age: 30,
        gender: state.genderController.text,
        // height: double.parse(state.heightController.text),
        height: 1.75,
        // weight: double.parse(state.weightController.text),
        weight: 60,
        skinColor: state.skinColorController.text,
        bodyShape: state.bodyShapeController.text,
        healthCase: state.healthCaseController.text,
        // smoking: state.smokingController.text,
        // prayer: state.prayerController.text,
        // religiousCommitment: state.religiousCommitmentController.text,
        // monthlyIncome: int.parse(state.monthlyIncomeController.text),
        smoking: false,
        prayer: true,
        religiousCommitment: true,
        maritalStatus: state.maritalStatusController.text,
        marriageType: state.marriageTypeController.text,
        // children: int.parse(state.childrenController.text),
        children: 3,
        educationalQualification: state.educationalQualificationController.text,
        jobCategory: state.jobCategoryController.text,
        job: state.jobController.text,
        monthlyIncome: 1200,
        financialStatus: state.financialStatusController.text,
        nationality: state.nationalityController.text,
        city: state.cityController.text,
        country: state.countryController.text,
        aboutYourSelf: state.aboutYourSelfController.text,
        aboutYourPartner: state.aboutYourPartnerController.text,
        beard: state.beardController.text,
        viel: state.vielController.text,
        // longitude: double.parse(
        //   state.longitudeController.text,
        // ),
        // latitude: double.parse(state.latitudeController.text),
        longitude: 24.7136,
        latitude: 46.6734);
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final bloc = context.read<SignupBloc>();
    return BlocConsumer<SignupBloc, SignupState>(
      builder: (context, state) {
        switch (state) {
          case SignupLoading():
            return const Scaffold(
              body: Center(
                child: CupertinoActivityIndicator(
                  color: CustomColors.primary,
                ),
              ),
            );

          case SignupSuccess():
            return const Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.done,
                      color: CustomColors.chatName,
                      size: 50,
                    ),

                    // a success message
                    Text(
                      "Signup successful",
                      style: TextStyle(
                        color: CustomColors.success,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );

          case SignupDefault():
            Future.microtask(() {
              if (context.mounted && state.errorMessage != null) {
                CustomSnackBar(
                  context: context,
                  message: state.errorMessage!,
                  type: SnackBarType.error,
                ).showSnack();
              }
            });
            return BlocConsumer<SignupBloc, SignupState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is SignupDefault) {
                  return Scaffold(
                    body: SafeArea(
                      child: SingleChildScrollView(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CustomTopBar(
                                altRoute: Routes.signup,
                                excludeLangDropDown: true,
                              ),
                              Visibility(
                                visible: state is SignupDefault,
                                child: Column(
                                  children: [
                                    AddressSection(
                                      cityController: state.cityController,
                                      countryController:
                                          state.countryController,
                                      nationalityController:
                                          state.nationalityController,
                                    ),
                                    SizedBox(height: 19.h),
                                    MaritialSection(
                                      ageController: state.ageController,
                                      childrenController:
                                          state.childrenController,
                                      maritialStatusController:
                                          state.maritalStatusController,
                                      marriageTypeController:
                                          state.marriageTypeController,
                                    ),
                                    SizedBox(height: 19.h),
                                    LooksSection(
                                      weightController: state.weightController,
                                      heightController: state.heightController,
                                      bodyShapeController:
                                          state.bodyShapeController,
                                      skinColorController:
                                          state.skinColorController,
                                    ),
                                    SizedBox(height: 19.h),
                                    ReligionSection(
                                      gender: gender,
                                      beardController: state.beardController,
                                      vielController: state.vielController,
                                      prayerController: state.prayerController,
                                      religionCommitmentController:
                                          state.religiousCommitmentController,
                                      smokingController:
                                          state.smokingController,
                                    ),
                                    SizedBox(height: 19.h),
                                    EducationAndWorkSection(
                                      educationalQualificationController: state
                                          .educationalQualificationController,
                                      financialStatusController:
                                          state.financialStatusController,
                                      jobCategoryController:
                                          state.jobCategoryController,
                                      jobController: state.jobController,
                                      monthlyIncomeController:
                                          state.monthlyIncomeController,
                                      healthCaseController:
                                          state.healthCaseController,
                                    ),
                                    SizedBox(height: 19.h),
                                    AboutYourPartnerSection(
                                      aboutYourPartnerController:
                                          state.aboutYourPartnerController,
                                    ),
                                    SizedBox(height: 19.h),
                                    TalkAboutYourSelfSection(
                                      aboutYourSelfController:
                                          state.aboutYourSelfController,
                                    ),
                                    SizedBox(height: 19.h),
                                    Text(
                                      'App Terms',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    SizedBox(height: 19.h),
                                    const ListDotItem(
                                      text:
                                          'By clicking on sign up button, you agree to',
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        'Terms and Conditions',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w300,
                                          color: CustomColors.textRed,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 54.h),
                                    CustomButton(
                                      onPressed: () async {
                                        if (true) {
                                          final DatabaseHelper databaseHelper =
                                              RepositoryProvider.of<
                                                  DatabaseHelper>(context);
                                          final gender =
                                              await databaseHelper.getGender();

                                          final signupModel =
                                              convertToSignupModel(state);

                                          bloc.add(
                                            RegisterUser(
                                              signupModel: signupModel,
                                              gender: gender,
                                            ),
                                          );
                                        }
                                      },
                                      text: 'Sign up',
                                      shadowColor: CustomColors.shadowBlue,
                                      elevation: 5,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    SizedBox(height: 30.h),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
                // incase something went bad and the state is not as expected.
                return const SizedBox.shrink();
              },
            );
          default:
            return Scaffold(
              body: Center(
                child: Text(
                  'Unimplemented state $state',
                ),
              ),
            );
        }
      },
      listener: (context, state) {
        if (state is SignupSuccess) {
          context.go(Routes.login);
          CustomSnackBar(
            context: context,
            message: 'Signed up user successfully',
            type: SnackBarType.success,
          );
        }
        if (state is SignupDefault && state.error != SignupError.none) {
          CustomSnackBar(
            context: context,
            message: 'Could not signup user ${state.errorMessage}',
            type: SnackBarType.success,
          );
        }
      },
    );
  }
}
