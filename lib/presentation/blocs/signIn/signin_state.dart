part of 'signin_bloc.dart';

abstract class SignInState extends Equatable {
  SignInState();

  @override
  List<Object> get props => [];
}

class SignInStateEmpty extends SignInState {
  SignInStateEmpty();
}

class SignInStateLoding extends SignInState {
  SignInStateLoding();
}

class SignInStateFaliure extends SignInState {
  final String message;
  SignInStateFaliure({@required this.message});
  List<Object> get props => [message];
}

class SignInStateSuccess extends SignInState {
  SignInStateSuccess();
}
