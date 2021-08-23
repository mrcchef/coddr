part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  // String state;
  // AuthenticationState(this.state);
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {
  AuthenticationInitial();
}

class Authenticated extends AuthenticationState {
  final String email;
  Authenticated({@required this.email});

  @override
  List<Object> get props => [email];
}

class UnAuthenticated extends AuthenticationState {
  UnAuthenticated();
}
