import 'package:equatable/equatable.dart';
import 'package:qismati/common/models/profile.dart';

class EditedProfileModel extends Equatable {
  final Location? location;
  final String? userName;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final int? age;
  final double? height;
  final double? weight;
  final String? skinColor;
  final String? bodyShape;
  final String? healthCase;
  final bool? smoking;
  final bool? prayer;
  final bool? religiousCommitment;
  final String? maritalStatus;
  final String? marriageType;
  final int? children;
  final String? educationalQualification;
  final String? jobCategory;
  final String? job;
  final int? monthlyIncome;
  final String? financialStatus;
  final String? nationality;
  final String? city;
  final String? country;
  final String? aboutYourSelf;
  final String? aboutYourPartner;
  final String? beard;
  final String? viel;
  final DateTime? lastVerificationEmailSentOn;
  final bool? appearOnSearch;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const EditedProfileModel({
    this.location,
    this.userName,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.age,
    this.height,
    this.weight,
    this.skinColor,
    this.bodyShape,
    this.healthCase,
    this.smoking,
    this.prayer,
    this.religiousCommitment,
    this.maritalStatus,
    this.marriageType,
    this.children,
    this.educationalQualification,
    this.jobCategory,
    this.job,
    this.monthlyIncome,
    this.financialStatus,
    this.nationality,
    this.city,
    this.country,
    this.aboutYourSelf,
    this.aboutYourPartner,
    this.beard,
    this.viel,
    this.lastVerificationEmailSentOn,
    this.appearOnSearch,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        fullName,
        email,
        phoneNumber,
        age,
        height,
        weight,
        skinColor,
        bodyShape,
        healthCase,
        smoking,
        prayer,
        religiousCommitment,
        maritalStatus,
        marriageType,
        children,
        educationalQualification,
        jobCategory,
        job,
        monthlyIncome,
        financialStatus
      ];
}
