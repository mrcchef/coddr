part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class FetchProfileData extends ProfileEvent {}

class VerifyEmailButtonPressedEvent extends ProfileEvent {}

class UpdateProfileData extends ProfileEvent {
  final UserModel userModel;

  UpdateProfileData({@required this.userModel});
}

class StoreProfileData extends ProfileEvent {
  final UserModel userModel;

  StoreProfileData({@required this.userModel});
}