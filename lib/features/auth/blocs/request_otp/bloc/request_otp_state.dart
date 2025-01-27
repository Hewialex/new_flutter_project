part of 'request_otp_bloc.dart';

abstract class RequestOtpState extends Equatable {
  const RequestOtpState();

  @override
  List<Object> get props => [];
}

class RequestOtpInitial extends RequestOtpState {}

class RequestOtpSuccess extends RequestOtpState {
  final String otp;

  const RequestOtpSuccess({required this.otp});

  @override
  List<Object> get props => [otp];
}

class RequestOtpLoading extends RequestOtpState {}

class RequestOtpFailure extends RequestOtpState {
  final String error;

  const RequestOtpFailure(this.error);

  @override
  List<Object> get props => [error];
}
