part of 'verify_email_otp_bloc.dart';

abstract class VerifyEmailOtpEvent extends Equatable {
  const VerifyEmailOtpEvent();

  @override
  List<Object> get props => [];
}

class VerifyEmailOtpVerify extends VerifyEmailOtpEvent {
  final String otp;
  final String email;

  const VerifyEmailOtpVerify({
    required this.otp,
    required this.email,
  });

  @override
  List<Object> get props => [otp, email];
}
