import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qismati/constants.dart';

part 'newpassword_state.dart';

class NewpasswordCubit extends Cubit<NewpasswordState> {
  NewpasswordCubit() : super(NewpasswordInitial());

  void sendnewPasswordRequest(Map<String, dynamic> newpasswordData) async {
    const String url = "${Constants.baseUrl}/auth/resetpassword";

    final sentData = jsonEncode(newpasswordData);

    emit(NewpasswordLoading());

    try {
      // final res = await http.post(
      //   Uri.parse(url),
      //   headers: <String, String>{
      //     "Content-Type": "application/json",
      //   },
      //   body: sentData,
      // );

      // if (res.statusCode == 200) {
      emit(const NewpasswordSuccess(message: 'success'));
      // } else {
      //   final body = jsonDecode(res.body) as Map<String, dynamic>;
      //   emit(
      //     NewpasswordFailure(message: body["message"]),
      //   );
      // }
    } catch (e) {
      emit(NewpasswordFailure(message: e.toString()));
    }
  }
}
