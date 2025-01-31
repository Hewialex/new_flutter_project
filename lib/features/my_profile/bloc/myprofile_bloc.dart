import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qismati/common/models/profile.dart';
import 'package:qismati/core/error/global_exception.dart';
import 'package:qismati/features/my_profile/data/my_profile_data.dart';
import 'package:qismati/features/my_profile/model/editable_profile_model.dart';

part 'myprofile_state.dart';
part 'myprofile_event.dart';

class MyprofileBloc extends Bloc<MyProfileEvent, MyprofileState> {
  MyprofileBloc() : super(MyprofileInitial()) {
    on<UpdateProfile>(handleUpdateProfile);
    on<LoadMyProfile>(handleGetMyProfile);
  }

  final MyProfileDataProvider _profileDataProvider = MyProfileDataProvider();

  void handleUpdateProfile(
      UpdateProfile event, Emitter<MyprofileState> emit) async {
    final currState = state;
    if (currState is MyprofileSuccess || currState is MyprofileUpdateError) {
      final prevProfile = currState is MyprofileSuccess
          ? currState.profile
          : (currState as MyprofileUpdateError).profile;

      try {
        final EditedProfileModel newProfile = event.profile;
        final ProfileModel optimisticUpdatedProfile =
            ProfileModel.updateWithEditableProfile(prevProfile, newProfile);

        emit(MyprofileLoading(profile: optimisticUpdatedProfile));

        final ProfileModel updatedProfile = await _profileDataProvider
            .updateMyProfile(optimisticUpdatedProfile);
        emit(MyprofileSuccess(updatedProfile));
      } catch (e) {
        emit(MyprofileUpdateError(
          profile: prevProfile,
          message: e.toString(),
        ));
      }
    }
  }

  void handleGetMyProfile(
    LoadMyProfile event,
    Emitter<MyprofileState> emit,
  ) async {
    final currState = state;

    if (currState is MyprofileLoading) {
      return;
    }
    emit(MyprofileLoading());

    try {
      final profile = await _profileDataProvider.getMyProfile();
      emit(MyprofileSuccess(profile));
    } catch (e) {
      emit(MyprofileError(ErrorMapper.mapError(e).message));
    }
  }
}
