import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(
          LoginDefault(
            emailController: TextEditingController(),
            passwordController: TextEditingController(),
          ),
        ) {
    on<AttemptLogin>(_attemptLogin);
    on<LoginReset>(_resetLogin);
  }

  FutureOr<void> _attemptLogin(event, emit) async {
    emit(LoginVerification());
    await Future.delayed(const Duration(seconds: 2));
    emit(LoginSuccess());
    // if (state is LoginDefault) {
    //   final prevLoginState = state as LoginDefault;
    //   try {
    //     emit(LoginVerification());
    //     await FirebaseAuth.instance.signInWithEmailAndPassword(
    //       email: prevLoginState.emailController.text,
    //       password: prevLoginState.passwordController.text,
    //     );
  
    //     debugPrint(prevLoginState.emailController.text);
    //     debugPrint(prevLoginState.passwordController.text);
    //     emit(LoginSuccess());
    //     prevLoginState.dispose();
    //   } on FirebaseAuthException catch (e) {
    //     debugPrint(e.code);
    //     emit(prevLoginState.copyWith(
    //       err: _mapErrorCodeToLoginErr(e.code),
    //       errorMessage: e.message,
    //     ));
    //   }
    // }
  }

  FutureOr<void> _resetLogin(event, emit) async {
    final prevLoginState = state as LoginDefault;
    emit(
      LoginDefault(
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        err: LoginErr.none,
      ),
    );
    prevLoginState.dispose();
  }

  // map error code to error LoginErr
  LoginErr _mapErrorCodeToLoginErr(String code) {
    switch (code) {
      case 'user-not-found':
        return LoginErr.userNotFound;
      case 'wrong-password':
        return LoginErr.input;
      default:
        return LoginErr.network;
    }
  }
}
