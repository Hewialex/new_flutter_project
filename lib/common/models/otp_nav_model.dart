// ignore_for_file: public_member_api_docs, sort_constructors_first
class OtpNavModel {
  final bool isFromSignUp;
  final bool isFromForgtenPassword;
  final String? otp;
  final String? email;

  OtpNavModel({
    required this.isFromSignUp,
    required this.isFromForgtenPassword,
    required this.otp,
    required this.email,
  });
}
