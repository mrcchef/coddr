part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  String state;
  AuthenticationState(this.state);
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {
  AuthenticationInitial() : super("unAuth");
}

class Authenticated extends AuthenticationState {
  final String email;
  Authenticated({@required this.email}) : super("auth");

  @override
  List<Object> get props => [email];
}

class UnAuthenticated extends AuthenticationState {
  UnAuthenticated() : super("unAuth");
}
