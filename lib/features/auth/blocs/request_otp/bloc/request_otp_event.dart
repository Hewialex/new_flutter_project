part of 'request_otp_bloc.dart';

abstract class RequestOtpEvent extends Equatable {
  const RequestOtpEvent();

  @override
  List<Object> get props => [];
}

class RequestOtpThroughEmail extends RequestOtpEvent {
  final SignupBeforeVerificationModel signupBeforeVerificationModel;

  const RequestOtpThroughEmail({required this.signupBeforeVerificationModel});

  @override
  List<Object> get props => [signupBeforeVerificationModel];
}
