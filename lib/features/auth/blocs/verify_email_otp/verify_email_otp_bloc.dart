import 'package:dio/dio.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qismati/constants.dart';
import 'package:qismati/core/database/database_helper.dart';
import 'package:qismati/core/error/global_exception.dart';

part 'verify_email_otp_event.dart';
part 'verify_email_otp_state.dart';

class VerifyEmailOtpBloc
    extends Bloc<VerifyEmailOtpEvent, VerifyEmailOtpState> {
  final DatabaseHelper databaseHelper;
  VerifyEmailOtpBloc({required this.databaseHelper})
      : super(VerifyEmailOtpInitial()) {
    on<VerifyEmailOtpRequestEvent>(_onVerifyEmailOtp);
  }

  Future<void> _onVerifyEmailOtp(
    VerifyEmailOtpRequestEvent event,
    Emitter<VerifyEmailOtpState> emit,
  ) async {
    emit(VerifyEmailOtpLoading());
    final dio = Dio();

    try {
      final res = await dio.post(
        Constants.email_verification_url,
        data: {
          "email": event.email,
          "code": event.otp,
        },
      );

      final body = res.data;
      if (res.statusCode == 200 || res.statusCode == 201) {
        final token = body["token"];

        await databaseHelper.saveToken(token);

        emit(VerifyEmailOtpSuccess(message: body["message"]));
      } else {
        emit(const VerifyEmailOtpFailure(errorMessage: 'Failed to send OTP'));
      }
    } catch (e) {
      emit(
          VerifyEmailOtpFailure(errorMessage: ErrorMapper.mapError(e).message));
    }
  }
}
