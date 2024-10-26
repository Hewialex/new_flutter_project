part of 'signup_bloc.dart';

sealed class SignupState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupDefault extends SignupState {
  final TextEditingController userNameController;
  final TextEditingController fullNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  final TextEditingController nationalityController;
  final TextEditingController countryController;
  final TextEditingController cityController;

  // Marital Section
  final TextEditingController maritalStatusController;
  final TextEditingController marriageTypeController;
  final TextEditingController ageController;
  final TextEditingController childrenController;

  // your look section
  final TextEditingController weightController;
  final TextEditingController heightController;
  final TextEditingController skinColorController;
  final TextEditingController bodyShapeController;

  // Religion section
  final TextEditingController religiousCommitmentController;
  final TextEditingController prayerController;
  final TextEditingController smokingController;
  final TextEditingController beardController; // for men only

  // Education and work section
  final TextEditingController educationQualificationController;
  final TextEditingController financialStatusController;
  final TextEditingController jobCategoryController;
  final TextEditingController jobController;
  final TextEditingController montlyIncomeController;
  final TextEditingController healthCaseController;

  // About yourself
  final TextEditingController aboutYourPartnerController;
  final TextEditingController aboutYourSelfController;
  final TextEditingController vielController;

  final SignupErr? err;
  final String? errorMessage;

  SignupDefault({
    required this.fullNameController,
    required this.phoneNumberController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.nationalityController,
    required this.countryController,
    required this.userNameController,
    required this.cityController,
    required this.maritalStatusController,
    required this.marriageTypeController,
    required this.ageController,
    required this.childrenController,
    required this.weightController,
    required this.heightController,
    required this.skinColorController,
    required this.bodyShapeController,
    required this.religiousCommitmentController,
    required this.prayerController,
    required this.smokingController,
    required this.beardController,
    required this.educationQualificationController,
    required this.financialStatusController,
    required this.jobCategoryController,
    required this.jobController,
    required this.montlyIncomeController,
    required this.healthCaseController,
    required this.aboutYourSelfController,
    required this.aboutYourPartnerController,
    required this.vielController,
    this.err,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        fullNameController,
        phoneNumberController,
        emailController,
        passwordController,
        confirmPasswordController,
        nationalityController,
        countryController,
        userNameController,
        cityController,
        maritalStatusController,
        marriageTypeController,
        ageController,
        childrenController,
        weightController,
        heightController,
        skinColorController,
        bodyShapeController,
        religiousCommitmentController,
        prayerController,
        smokingController,
        beardController,
        educationQualificationController,
        financialStatusController,
        jobCategoryController,
        jobController,
        montlyIncomeController,
        healthCaseController,
        aboutYourSelfController,
        aboutYourPartnerController,
        vielController,
        err,
        errorMessage
      ];

  // when we just want to add an error message to the state

  SignupDefault copyWith({
    SignupErr? err,
    String? errorMessage,
  }) {
    return SignupDefault(
      fullNameController: fullNameController,
      phoneNumberController: phoneNumberController,
      emailController: emailController,
      passwordController: passwordController,
      confirmPasswordController: confirmPasswordController,
      nationalityController: nationalityController,
      countryController: countryController,
      userNameController: userNameController,
      cityController: cityController,
      maritalStatusController: maritalStatusController,
      marriageTypeController: marriageTypeController,
      ageController: ageController,
      childrenController: childrenController,
      weightController: weightController,
      heightController: heightController,
      skinColorController: skinColorController,
      bodyShapeController: bodyShapeController,
      religiousCommitmentController: religiousCommitmentController,
      prayerController: prayerController,
      smokingController: smokingController,
      beardController: beardController,
      educationQualificationController: educationQualificationController,
      financialStatusController: financialStatusController,
      jobCategoryController: jobCategoryController,
      jobController: jobController,
      montlyIncomeController: montlyIncomeController,
      healthCaseController: healthCaseController,
      aboutYourSelfController: aboutYourSelfController,
      aboutYourPartnerController: aboutYourPartnerController,
      vielController: vielController,
      err: err,
      errorMessage: errorMessage,
    );
  }
}

class SignupSuccess extends SignupState {}

class SignupPending extends SignupState {}

enum SignupErr {
  none,
  network,
  userNotFound,
  input,
}
