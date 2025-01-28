import 'package:equatable/equatable.dart';

class SignupModel extends Equatable {
  final String? userName;
  final String? fullName;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final int age; // String??
  final String? gender;
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
  final String beard;
  final String viel;
  final double longitude;
  final double latitude;

  const SignupModel({
    this.userName,
    this.fullName,
    this.email,
    this.password,
    this.phoneNumber,
    required this.age,
    this.gender,
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
    required this.beard,
    required this.viel,
    required this.longitude,
    required this.latitude,
  });

  Map<String, dynamic> toJson(String gender) {
    final jsonData = <String, dynamic>{
      "userName": userName,
      "fullName": fullName,
      "email": email,
      "password": password,
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
      "viel": viel,
      "location": <String, dynamic>{
        "type": "Point",
        "coordinates": <double>[
          longitude,
          latitude,
        ]
      }
    };

    if (gender == 'Male') {
      jsonData["beard"] = beard;
    } else {
      jsonData["viel"] = viel;
    }

    return jsonData;
  }

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      userName: json["userName"] as String,
      fullName: json["fullName"] as String,
      email: json["email"] as String,
      password: json["password"] as String,
      phoneNumber: json["phoneNumber"],
      age: json["age"] as int,
      gender: json["gender"] as String,
      height: json["height"] as double,
      weight: json["weight"] as double,
      skinColor: json["skinColor"] as String,
      bodyShape: json["bodyShape"] as String,
      healthCase: json["healthCase"] as String,
      smoking: json["smoking"] as bool,
      prayer: json["prayer"] as bool,
      religiousCommitment: json["religiousCommitment"] as bool,
      maritalStatus: json["maritalStatus"] as String,
      marriageType: json["marriageType"] as String,
      children: json["children"] as int,
      educationalQualification: json["educationalQualification"] as String,
      jobCategory: json["jobCategory"] as String,
      job: json["job"] as String,
      monthlyIncome: json["monthlyIncome"] as int,
      financialStatus: json["financialStatus"] as String,
      nationality: json["nationality"] as String,
      city: json["city"] as String,
      country: json["country"] as String,
      aboutYourSelf: json["aboutYourSelf"] as String,
      aboutYourPartner: json["aboutYourPartner"] as String,
      beard: json["beard"] as String,
      viel: json["viel"] as String,
      longitude: json["location"]["coordinates"][0] as double,
      latitude: json["location"]["coordinates"][1] as double,
    );
  }

  @override
  List<Object?> get props => [
        userName,
        fullName,
        email,
        password,
        phoneNumber,
        age,
        gender,
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
        financialStatus,
        nationality,
        city,
        country,
        aboutYourSelf,
        aboutYourPartner,
        beard,
        viel,
        longitude,
        latitude
      ];
}
