part of 'signup_bloc.dart';

sealed class SignupState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupDefault extends SignupState {
  final TextEditingController userNameController;
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneNumberController;
  final TextEditingController ageController;
  final TextEditingController genderController;
  final TextEditingController heightController;
  final TextEditingController weightController;
  final TextEditingController skinColorController;
  final TextEditingController bodyShapeController;
  final TextEditingController healthCaseController;
  final TextEditingController smokingController;
  final TextEditingController prayerController;
  final TextEditingController religiousCommitmentController;
  final TextEditingController maritalStatusController;
  final TextEditingController marriageTypeController;
  final TextEditingController childrenController;
  final TextEditingController educationalQualificationController;
  final TextEditingController jobCategoryController;
  final TextEditingController jobController;
  final TextEditingController monthlyIncomeController;
  final TextEditingController financialStatusController;
  final TextEditingController nationalityController;
  final TextEditingController cityController;
  final TextEditingController countryController;
  final TextEditingController aboutYourSelfController;
  final TextEditingController aboutYourPartnerController;
  final TextEditingController beardController;
  final TextEditingController vielController;
  final TextEditingController longitudeController;
  final TextEditingController latitudeController;
  final SignupError error;
  final String? errorMessage;

  SignupDefault({
    required this.userNameController,
    required this.fullNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneNumberController,
    required this.ageController,
    required this.genderController,
    required this.heightController,
    required this.weightController,
    required this.skinColorController,
    required this.bodyShapeController,
    required this.healthCaseController,
    required this.smokingController,
    required this.prayerController,
    required this.religiousCommitmentController,
    required this.maritalStatusController,
    required this.marriageTypeController,
    required this.childrenController,
    required this.educationalQualificationController,
    required this.jobCategoryController,
    required this.jobController,
    required this.monthlyIncomeController,
    required this.financialStatusController,
    required this.nationalityController,
    required this.cityController,
    required this.countryController,
    required this.aboutYourSelfController,
    required this.aboutYourPartnerController,
    required this.beardController,
    required this.vielController,
    required this.longitudeController,
    required this.latitudeController,
    required this.error,
    this.errorMessage,
  });

  SignupDefault copyWith({
    TextEditingController? userNameController,
    TextEditingController? fullNameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? confirmPasswordController,
    TextEditingController? phoneNumberController,
    TextEditingController? ageController,
    TextEditingController? genderController,
    TextEditingController? heightController,
    TextEditingController? weightController,
    TextEditingController? skinColorController,
    TextEditingController? bodyShapeController,
    TextEditingController? healthCaseController,
    TextEditingController? smokingController,
    TextEditingController? prayerController,
    TextEditingController? religiousCommitmentController,
    TextEditingController? maritalStatusController,
    TextEditingController? marriageTypeController,
    TextEditingController? childrenController,
    TextEditingController? educationalQualificationController,
    TextEditingController? jobCategoryController,
    TextEditingController? jobController,
    TextEditingController? monthlyIncomeController,
    TextEditingController? financialStatusController,
    TextEditingController? nationalityController,
    TextEditingController? cityController,
    TextEditingController? countryController,
    TextEditingController? aboutYourSelfController,
    TextEditingController? aboutYourPartnerController,
    TextEditingController? beardController,
    TextEditingController? vielController,
    TextEditingController? longitudeController,
    TextEditingController? latitudeController,
    SignupError? error,
    String? errorMessage,
  }) {
    return SignupDefault(
      userNameController: userNameController ?? this.userNameController,
      fullNameController: fullNameController ?? this.fullNameController,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      confirmPasswordController:
          confirmPasswordController ?? this.confirmPasswordController,
      phoneNumberController:
          phoneNumberController ?? this.phoneNumberController,
      ageController: ageController ?? this.ageController,
      genderController: genderController ?? this.genderController,
      heightController: heightController ?? this.heightController,
      weightController: weightController ?? this.weightController,
      skinColorController: skinColorController ?? this.skinColorController,
      bodyShapeController: bodyShapeController ?? this.bodyShapeController,
      healthCaseController: healthCaseController ?? this.healthCaseController,
      smokingController: smokingController ?? this.smokingController,
      prayerController: prayerController ?? this.prayerController,
      religiousCommitmentController:
          religiousCommitmentController ?? this.religiousCommitmentController,
      maritalStatusController:
          maritalStatusController ?? this.maritalStatusController,
      marriageTypeController:
          marriageTypeController ?? this.marriageTypeController,
      childrenController: childrenController ?? this.childrenController,
      educationalQualificationController: educationalQualificationController ??
          this.educationalQualificationController,
      jobCategoryController:
          jobCategoryController ?? this.jobCategoryController,
      jobController: jobController ?? this.jobController,
      monthlyIncomeController:
          monthlyIncomeController ?? this.monthlyIncomeController,
      financialStatusController:
          financialStatusController ?? this.financialStatusController,
      nationalityController:
          nationalityController ?? this.nationalityController,
      cityController: cityController ?? this.cityController,
      countryController: countryController ?? this.countryController,
      aboutYourSelfController:
          aboutYourSelfController ?? this.aboutYourSelfController,
      aboutYourPartnerController:
          aboutYourPartnerController ?? this.aboutYourPartnerController,
      beardController: beardController ?? this.beardController,
      vielController: vielController ?? this.vielController,
      longitudeController: longitudeController ?? this.longitudeController,
      latitudeController: latitudeController ?? this.latitudeController,
      error: error ?? this.error,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        userNameController,
        fullNameController,
        emailController,
        passwordController,
        phoneNumberController,
        ageController,
        genderController,
        heightController,
        weightController,
        skinColorController,
        bodyShapeController,
        healthCaseController,
        smokingController,
        prayerController,
        religiousCommitmentController,
        maritalStatusController,
        marriageTypeController,
        childrenController,
        educationalQualificationController,
        jobCategoryController,
        jobController,
        monthlyIncomeController,
        financialStatusController,
        nationalityController,
        cityController,
        countryController,
        aboutYourSelfController,
        aboutYourPartnerController,
        beardController,
        vielController,
        longitudeController,
        latitudeController,
        error,
        errorMessage,
      ];
}

class SignupSuccess extends SignupState {}

class SignupLoading extends SignupState {}

enum SignupError { network, none, input }
