import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qismati/common/colors.dart';
import 'package:qismati/common/models/profile.dart';
import 'package:qismati/features/my_profile/bloc/myprofile_bloc.dart';
import 'package:qismati/features/my_profile/model/editable_profile_model.dart';
import 'package:qismati/generated/l10n.dart';

class ProfileEditingScreen extends StatefulWidget {
  final ProfileModel profile;

  const ProfileEditingScreen({super.key, required this.profile});

  @override
  ProfileEditingScreenState createState() => ProfileEditingScreenState();
}

class ProfileEditingScreenState extends State<ProfileEditingScreen> {
  late TextEditingController nationalityController;
  late TextEditingController countryController;
  late TextEditingController cityController;
  late TextEditingController marriageTypeController;
  late TextEditingController maritalStatusController;
  late TextEditingController ageController;
  late TextEditingController childrenController;
  late TextEditingController heightController;
  late TextEditingController weightController;
  late TextEditingController skinColorController;
  late TextEditingController bodyShapeController;
  late TextEditingController jobController;
  late TextEditingController educationalQualificationController;
  late TextEditingController financialStatusController;
  late TextEditingController monthlyIncomeController;
  late TextEditingController healthCaseController;
  late TextEditingController religiousCommitmentController;
  late TextEditingController veilOrBeardController;

  @override
  void initState() {
    super.initState();

    nationalityController =
        TextEditingController(text: widget.profile.nationality);
    countryController = TextEditingController(text: widget.profile.country);
    cityController = TextEditingController(text: widget.profile.city);
    marriageTypeController =
        TextEditingController(text: widget.profile.marriageType);
    maritalStatusController =
        TextEditingController(text: widget.profile.maritalStatus);
    ageController = TextEditingController(text: widget.profile.age.toString());
    childrenController =
        TextEditingController(text: widget.profile.children.toString());
    heightController =
        TextEditingController(text: widget.profile.height.toString());
    weightController =
        TextEditingController(text: widget.profile.weight.toString());
    skinColorController = TextEditingController(text: widget.profile.skinColor);
    bodyShapeController = TextEditingController(text: widget.profile.bodyShape);
    jobController = TextEditingController(text: widget.profile.job);
    educationalQualificationController =
        TextEditingController(text: widget.profile.educationalQualification);
    financialStatusController =
        TextEditingController(text: widget.profile.financialStatus);
    monthlyIncomeController =
        TextEditingController(text: widget.profile.monthlyIncome.toString());
    healthCaseController =
        TextEditingController(text: widget.profile.healthCase);
    religiousCommitmentController = TextEditingController(
        text: widget.profile.religiousCommitment.toString());
    veilOrBeardController = TextEditingController(
      text: widget.profile.gender == "female"
          ? widget.profile.viel
          : widget.profile.beard,
    );
  }

  @override
  void dispose() {
    nationalityController.dispose();
    countryController.dispose();
    cityController.dispose();
    marriageTypeController.dispose();
    maritalStatusController.dispose();
    ageController.dispose();
    childrenController.dispose();
    heightController.dispose();
    weightController.dispose();
    skinColorController.dispose();
    bodyShapeController.dispose();
    jobController.dispose();
    educationalQualificationController.dispose();
    financialStatusController.dispose();
    monthlyIncomeController.dispose();
    healthCaseController.dispose();
    religiousCommitmentController.dispose();
    veilOrBeardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = S.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: CustomColors.primary,
        iconTheme: const IconThemeData(
          color: CustomColors.background,
        ),
        title: Text(
          localizations.editProfile,
          style: const TextStyle(
            color: CustomColors.background,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader(localizations.personalInformation),
            _buildEditableField(
                localizations.nationality, nationalityController),
            _buildEditableField(localizations.country, countryController),
            _buildEditableField(localizations.city, cityController),
            _buildEditableField(localizations.age, ageController,
                isNumber: true),
            _buildSectionHeader(localizations.maritalStatus),
            _buildEditableField(
                localizations.maritalStatus, maritalStatusController),
            _buildEditableField(localizations.children, childrenController,
                isNumber: true),
            _buildEditableField(
                localizations.marriageType, marriageTypeController),
            // TODO: Uncomment this later
            // _buildSectionHeader(localizations.physicalAttributes),
            _buildEditableField(localizations.height, heightController,
                isNumber: true),
            _buildEditableField(localizations.weight, weightController,
                isNumber: true),
            _buildEditableField(localizations.skinColor, skinColorController),
            _buildEditableField(localizations.bodyShape, bodyShapeController),
            _buildSectionHeader(localizations.professionalDetails),
            _buildEditableField(localizations.job, jobController),
            _buildEditableField(localizations.educationalQualification,
                educationalQualificationController),
            _buildEditableField(
                localizations.financialStatus, financialStatusController),
            _buildEditableField(
                localizations.monthlyIncome, monthlyIncomeController),
            _buildSectionHeader(localizations.additionalInformation),
            _buildEditableField(localizations.healthCase, healthCaseController),
            _buildEditableField(
              widget.profile.gender == "female"
                  ? localizations.veil
                  : localizations.beard,
              veilOrBeardController,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _saveProfile,
        label: Text(localizations.save),
        icon: const Icon(Icons.save),
        backgroundColor: CustomColors.primary,
      ),
    );
  }

  Widget _buildEditableField(String label, TextEditingController controller,
      {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: TextField(
            controller: controller,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(
              labelText: label,
              border: InputBorder.none,
              icon: const Icon(Icons.edit, color: CustomColors.primary),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: CustomColors.primary,
            ),
      ),
    );
  }

  void _saveProfile() {
    final updatedProfile = EditedProfileModel(
      nationality: nationalityController.text,
      country: countryController.text,
      city: cityController.text,
      marriageType: marriageTypeController.text,
      maritalStatus: maritalStatusController.text,
      age: int.tryParse(ageController.text) ?? widget.profile.age,
      children:
          int.tryParse(childrenController.text) ?? widget.profile.children,
      height: double.tryParse(heightController.text) ?? widget.profile.height,
      weight: double.tryParse(weightController.text) ?? widget.profile.weight,
      skinColor: skinColorController.text,
      bodyShape: bodyShapeController.text,
      job: jobController.text,
      educationalQualification: educationalQualificationController.text,
      financialStatus: financialStatusController.text,
      monthlyIncome: int.tryParse(monthlyIncomeController.text) ??
          widget.profile.monthlyIncome,
      healthCase: healthCaseController.text,
      religiousCommitment: bool.tryParse(religiousCommitmentController.text) ??
          widget.profile.religiousCommitment,
      viel:
          widget.profile.gender == "female" ? veilOrBeardController.text : null,
      beard:
          widget.profile.gender == "male" ? veilOrBeardController.text : null,
    );

    context.read<MyprofileBloc>().add(UpdateProfile(profile: updatedProfile));

    // Navigate back
    Navigator.of(context).pop();
  }
}
