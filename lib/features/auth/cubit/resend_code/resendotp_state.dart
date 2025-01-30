part of 'resendotp_cubit.dart';

abstract class ResendotpState extends Equatable {
  const ResendotpState();

  @override
  List<Object> get props => [];
}

class ResendotpInitial extends ResendotpState {}

class ResendotpLoading extends ResendotpState {}

class ResendotpSuccess extends ResendotpState {
  final String message;

  const ResendotpSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class ResendotpFailure extends ResendotpState {
  final String errorMessage;

  const ResendotpFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
