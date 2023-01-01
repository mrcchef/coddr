part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoding extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserModel userModel;
  ProfileLoaded({this.userModel});
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError({this.message});
}

class ProfileUpdated extends ProfileState {}
