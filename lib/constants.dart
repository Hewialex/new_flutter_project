class Constants {
  static const String baseUrl = 'https://qismati-backend.onrender.com/api/v1';
  static const String simpleUrl = 'dating-backend-sf1t.onrender.com';

  // Auth endpoints
  static const String signup_url = '$baseUrl/auth/signup';
  static const String profile_setup_url = '$baseUrl/user/profile-setup';
  static const String validate_username_url = '$baseUrl/auth/validateUserName';
  static const String login_url = '$baseUrl/auth/login';
  static const String email_verification_url = '$baseUrl/auth/verifyemail';
  static const String resend_otp_url = '$baseUrl/auth/resendemail';
  static const String forgot_password_url = '$baseUrl/auth/forgotpassword';
  static const String verify_reset_otp_url = '$baseUrl/auth/verify-reset-otp';
  static const String reset_password_url = '$baseUrl/auth/resetpassword';
  static const String get_me_url = '$baseUrl/auth/me';
  static const String update_profile_url = '$baseUrl/user';
}
