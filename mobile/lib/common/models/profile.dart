import 'package:equatable/equatable.dart';
import 'package:qismati/features/my_profile/model/editable_profile_model.dart';

class ProfileModel extends Equatable {
  final Location location;
  final String id;
  final String userName;
  final String fullName;
  final String email;
  final String phoneNumber;
  final int age;
  final String gender;
  final double height;
  final double weight;
  final String skinColor;
  final String bodyShape;
  final String healthCase;
  final bool smoking;
  final bool prayer;
  final bool religiousCommitment;
  final String maritalStatus;
  final String marriageType;
  final int children;
  final String educationalQualification;
  final String jobCategory;
  final String job;
  final int monthlyIncome;
  final String financialStatus;
  final String nationality;
  final String city;
  final String country;
  final String aboutYourSelf;
  final String aboutYourPartner;
  final String? beard;
  final String? viel;
  final DateTime lastVerificationEmailSentOn;
  final bool isDeleted;
  final bool isBanned;
  final bool isVerified;
  final bool appearOnSearch;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ProfileModel({
    required this.location,
    required this.id,
    required this.userName,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    required this.skinColor,
    required this.bodyShape,
    required this.healthCase,
    required this.smoking,
    required this.prayer,
    required this.religiousCommitment,
    required this.maritalStatus,
    required this.marriageType,
    required this.children,
    required this.educationalQualification,
    required this.jobCategory,
    required this.job,
    required this.monthlyIncome,
    required this.financialStatus,
    required this.nationality,
    required this.city,
    required this.country,
    required this.aboutYourSelf,
    required this.aboutYourPartner,
    this.beard,
    this.viel,
    required this.lastVerificationEmailSentOn,
    required this.isDeleted,
    required this.isBanned,
    required this.isVerified,
    required this.appearOnSearch,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      location: Location.fromJson(json['location']),
      id: json['_id'],
      userName: json['userName'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      age: json['age'],
      gender: json['gender'],
      height: json['height'].toDouble(),
      weight: json['weight'].toDouble(),
      skinColor: json['skinColor'],
      bodyShape: json['bodyShape'],
      healthCase: json['healthCase'],
      smoking: json['smoking'],
      prayer: json['prayer'],
      religiousCommitment: json['religiousCommitment'],
      maritalStatus: json['maritalStatus'],
      marriageType: json['marriageType'],
      children: json['children'],
      educationalQualification: json['educationalQualification'],
      jobCategory: json['jobCategory'],
      job: json['job'],
      monthlyIncome: json['monthlyIncome'],
      financialStatus: json['financialStatus'],
      nationality: json['nationality'],
      city: json['city'],
      country: json['country'],
      aboutYourSelf: json['aboutYourSelf'],
      aboutYourPartner: json['aboutYourPartner'],
      beard: json['beard'],
      viel: json['viel'],
      lastVerificationEmailSentOn:
          DateTime.parse(json['lastVerificationEmailSentOn']),
      isDeleted: json['isDeleted'],
      isBanned: json['isBanned'],
      isVerified: json['isVerified'],
      appearOnSearch: json['appear_on_search'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "location": location.toJson(),
      "_id": id,
      "userName": userName,
      "fullName": fullName,
      "email": email,
      "phoneNumber": phoneNumber,
      "age": age,
      "gender": gender,
      "height": height,
      "weight": weight,
      "skinColor": skinColor,
      "bodyShape": bodyShape,
      "healthCase": healthCase,
      "smoking": smoking,
      "prayer": prayer,
      "religiousCommitment": religiousCommitment,
      "maritalStatus": maritalStatus,
      "marriageType": marriageType,
      "children": children,
      "educationalQualification": educationalQualification,
      "jobCategory": jobCategory,
      "job": job,
      "monthlyIncome": monthlyIncome,
      "financialStatus": financialStatus,
      "nationality": nationality,
      "city": city,
      "country": country,
      "aboutYourSelf": aboutYourSelf,
      "aboutYourPartner": aboutYourPartner,
      "beard": beard,
      "viel": viel,
      "lastVerificationEmailSentOn":
          lastVerificationEmailSentOn.toIso8601String(),
      "isDeleted": isDeleted,
      "isBanned": isBanned,
      "isVerified": isVerified,
      "appear_on_search": appearOnSearch,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
    };
  }

  factory ProfileModel.updateWithEditableProfile(
    ProfileModel profile,
    EditedProfileModel newProfile,
  ) {
    return ProfileModel(
      location: profile.location,
      id: profile.id,
      userName: profile.userName,
      fullName: newProfile.fullName ?? profile.fullName,
      email: profile.email,
      phoneNumber: newProfile.phoneNumber ?? profile.phoneNumber,
      age: newProfile.age ?? profile.age,
      gender: profile.gender,
      height: newProfile.height ?? profile.height,
      aboutYourPartner: newProfile.aboutYourPartner ?? profile.aboutYourPartner,
      aboutYourSelf: newProfile.aboutYourSelf ?? profile.aboutYourSelf,
      appearOnSearch: newProfile.appearOnSearch ?? profile.appearOnSearch,
      children: newProfile.children ?? profile.children,
      city: newProfile.city ?? profile.city,
      country: newProfile.country ?? profile.country,
      createdAt: profile.createdAt,
      financialStatus: newProfile.financialStatus ?? profile.financialStatus,
      healthCase: newProfile.healthCase ?? profile.healthCase,
      isBanned: profile.isBanned,
      isDeleted: profile.isDeleted,
      isVerified: profile.isVerified,
      job: newProfile.job ?? profile.job,
      jobCategory: newProfile.jobCategory ?? profile.jobCategory,
      lastVerificationEmailSentOn: profile.lastVerificationEmailSentOn,
      maritalStatus: newProfile.maritalStatus ?? profile.maritalStatus,
      marriageType: newProfile.marriageType ?? profile.marriageType,
      monthlyIncome: newProfile.monthlyIncome ?? profile.monthlyIncome,
      bodyShape: newProfile.bodyShape ?? profile.bodyShape,
      educationalQualification: newProfile.educationalQualification ??
          profile.educationalQualification,
      nationality: newProfile.nationality ?? profile.nationality,
      skinColor: newProfile.skinColor ?? profile.skinColor,
      prayer: newProfile.prayer ?? profile.prayer,
      religiousCommitment:
          newProfile.religiousCommitment ?? profile.religiousCommitment,
      updatedAt: DateTime.now(),
      smoking: newProfile.smoking ?? profile.smoking,
      weight: newProfile.weight ?? profile.weight,
      beard: newProfile.beard ?? profile.beard,
      viel: newProfile.viel ?? profile.viel,
    );
  }

  @override
  List<Object?> get props => [id, userName, email];
}

class Location {
  final String type;
  final List<double> coordinates;

  Location({required this.type, required this.coordinates});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json['type'],
      coordinates: List<double>.from(json['coordinates']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "coordinates": coordinates,
    };
  }
}
