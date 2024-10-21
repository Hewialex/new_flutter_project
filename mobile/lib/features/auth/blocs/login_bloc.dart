import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(
          LoginDefault(
            emailController: TextEditingController(),
            passwordController: TextEditingController(),
            err: LoginErr.none,
          ),
        ) {
    on<AttemptLogin>(_attemptLogin);
  }

  FutureOr<void> _attemptLogin(event, emit) async {
    if (state is LoginDefault) {
      // final loginState = state as LoginDefault;
      try {
        emit(LoginVerification());
        await Future.delayed(const Duration(seconds: 1));
        // await FirebaseAuth.instance.signInWithEmailAndPassword(
        //   email: loginState.emailController.text,
        //   password: loginState.passwordController.text,
        // );
        emit(LoginSuccess());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          debugPrint('User was not found');
          emit(LoginDefault(
            emailController: TextEditingController(),
            passwordController: TextEditingController(),
            err: LoginErr.userNotFound,
          ));
        } else if (e.code == 'wrong-password') {
          debugPrint('Wrong Password');
          emit(LoginDefault(
            emailController: TextEditingController(),
            passwordController: TextEditingController(),
            err: LoginErr.input,
          ));
        } else {
          debugPrint('There is some other problem');
          emit(LoginDefault(
            emailController: TextEditingController(),
            passwordController: TextEditingController(),
            err: LoginErr.network,
          ));
        }
      }
    }
  }
}
