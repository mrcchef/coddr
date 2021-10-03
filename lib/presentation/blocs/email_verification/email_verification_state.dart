part of 'email_verification_bloc.dart';

abstract class EmailVerificationState extends Equatable {
  EmailVerificationState();

  @override
  List<Object> get props => [];
}

class EmailVerificationInitial extends EmailVerificationState {}

class EmailVerificationLoading extends EmailVerificationState {}

class EmailVerificationDone extends EmailVerificationState {}

class EmailVerificationFailed extends EmailVerificationState {}
