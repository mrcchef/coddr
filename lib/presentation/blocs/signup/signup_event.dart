part of 'signup_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpWithCredentialsPressedEvent extends SignUpEvent {
  final String email, password, username;

  SignUpWithCredentialsPressedEvent(
      {@required this.email, @required this.password, @required this.username});

  @override
  List<Object> get props => [email, password, username];
}
