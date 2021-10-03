part of 'email_verification_bloc.dart';

abstract class EmailVerificationEvent extends Equatable {
  const EmailVerificationEvent();

  @override
  List<Object> get props => [];
}

class VerifyEmailEvent extends EmailVerificationEvent {
  final String uid;

  VerifyEmailEvent({@required this.uid});
}
