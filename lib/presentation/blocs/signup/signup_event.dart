part of 'signup_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpWithCredentialsPressedEvent extends SignUpEvent {
  final String email, password, displayName;

  SignUpWithCredentialsPressedEvent(
      {@required this.email,
      @required this.password,
      @required this.displayName});

  @override
  List<Object> get props => [email, password, displayName];
}
