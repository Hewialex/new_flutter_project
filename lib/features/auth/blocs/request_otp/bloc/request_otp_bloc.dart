import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:qismati/constants.dart';
import 'package:qismati/core/error/global_exception.dart';
import 'package:qismati/features/auth/models/signup_before_verification_model.dart';

part 'request_otp_event.dart';
part 'request_otp_state.dart';

class RequestOtpBloc extends Bloc<RequestOtpEvent, RequestOtpState> {
  final Dio _dio = Dio();

  RequestOtpBloc() : super(RequestOtpInitial()) {
    on<RequestOtpThroughEmail>(_attemptPinRequest);
  }

  Future<void> _attemptPinRequest(
    RequestOtpThroughEmail event,
    Emitter<RequestOtpState> emit,
  ) async {
    emit(RequestOtpLoading());

    final sendData = event.signupBeforeVerificationModel.toMap();
    try {
      final response = await _dio.post(Constants.signup_url, data: sendData);

      final body = response.data;
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(RequestOtpSuccess(otp: body["message"]));
      } else {
        emit(RequestOtpFailure(body["message"]));
      }
    } catch (e) {
      emit(RequestOtpFailure(ErrorMapper.mapError(e).message));
    }
  }
}
