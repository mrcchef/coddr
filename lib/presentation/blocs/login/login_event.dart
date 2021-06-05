part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailChangedEvent extends LoginEvent {
  final String email;
  EmailChangedEvent({@required this.email});

  @override
  List<Object> get props => [email];
}

class PasswordChangedEvent extends LoginEvent {
  final String password;

  PasswordChangedEvent({@required this.password});

  @override
  List<Object> get props => [password];
}

class SubmittedEvent extends LoginEvent {
  final String email, password;

  SubmittedEvent({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}

class LoginWithCredentialsPressedEvent extends LoginEvent {
  final String email, password;

  LoginWithCredentialsPressedEvent(
      {@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}
