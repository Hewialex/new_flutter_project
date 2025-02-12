class SignupBeforeVerificationModel {
  final String userName;
  final String gender;
  final String phoneNumber;
  final String email;
  final String password;

  SignupBeforeVerificationModel({
    required this.userName,
    required this.gender,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
    };
  }

  factory SignupBeforeVerificationModel.fromJson(Map<String, dynamic> json) {
    return SignupBeforeVerificationModel(
      userName: json['userName'] ?? '',
      gender: json['gender'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }
}
