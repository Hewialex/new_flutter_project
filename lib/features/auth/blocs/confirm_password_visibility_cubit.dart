import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmPasswordVisibilityCubit extends Cubit<bool> {
  ConfirmPasswordVisibilityCubit() : super(true);

  void toggleConfirmPasswordVisibility() {
    emit(!state);
  }
}
