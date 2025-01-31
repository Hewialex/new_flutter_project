part of 'verify_email_otp_bloc.dart';

abstract class VerifyEmailOtpState extends Equatable {
  const VerifyEmailOtpState();

  @override
  List<Object> get props => [];
}

class VerifyEmailOtpInitial extends VerifyEmailOtpState {}

class VerifyEmailOtpLoading extends VerifyEmailOtpState {}

class VerifyEmailOtpSuccess extends VerifyEmailOtpState {
  final String message;

  const VerifyEmailOtpSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class VerifyEmailOtpFailure extends VerifyEmailOtpState {
  final String errorMessage;

  const VerifyEmailOtpFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
