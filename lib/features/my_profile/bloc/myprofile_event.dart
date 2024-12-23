part of 'myprofile_bloc.dart';

class MyProfileEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdateProfile extends MyProfileEvent {
  final EditedProfileModel profile;

  UpdateProfile({required this.profile});

  @override
  List<Object> get props => [profile];
}

class LoadMyProfile extends MyProfileEvent {}
