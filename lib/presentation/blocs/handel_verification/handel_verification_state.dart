part of 'handel_verification_bloc.dart';

abstract class HandelVerificationState extends Equatable {
  const HandelVerificationState();
  
  @override
  List<Object> get props => [];
}

class HandelVerificationInitial extends HandelVerificationState {}

class HandelVerificationLoading extends HandelVerificationState {}

class HandelVerificationCompleted extends HandelVerificationState {}

class HandelVerificationCFEmailPrivate extends HandelVerificationState {}

class HandelVerificationFailed extends HandelVerificationState {}

