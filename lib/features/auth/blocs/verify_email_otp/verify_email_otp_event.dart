part of 'verify_email_otp_bloc.dart';

abstract class VerifyEmailOtpEvent extends Equatable {
  const VerifyEmailOtpEvent();

  @override
  List<Object> get props => [];
}

class VerifyEmailOtpRequestEvent extends VerifyEmailOtpEvent {
  final String otp;
  final String email;
  final bool isForgotPassword;

  const VerifyEmailOtpRequestEvent({
    required this.otp,
    required this.email,
    required this.isForgotPassword,
  });

  @override
  List<Object> get props => [otp, email];
}
