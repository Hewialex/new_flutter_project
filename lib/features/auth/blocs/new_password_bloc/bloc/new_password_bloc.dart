
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qismati/core/utils/form_filed_validations/password_match_validator.dart';

part 'new_password_event.dart';
part 'new_password_state.dart';

class NewPasswordBloc extends Bloc<NewPasswordEvent, NewPasswordState> {
  NewPasswordBloc()
      : super(
          NewPassWordInitial(
            confirmPasswordController: TextEditingController(),
            passwordController: TextEditingController(),
          ),
        );

  String? validateConfirmPw(String? value) {
    return confirmPasswordValidator(
        value, (state as NewPassWordInitial).passwordController.text);
  }
}
