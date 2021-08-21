part of 'signup_bloc.dart';

abstract class SignUpState extends Equatable {
  SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpStateEmpty extends SignUpState {
  SignUpStateEmpty();
}

class SignUpStateLoding extends SignUpState {
  SignUpStateLoding();
}

class SignUpStateFailure extends SignUpState {
  final String message;
  SignUpStateFailure({@required this.message});
  @override
  List<Object> get props => [message];
}

class SignUpStateSuccess extends SignUpState {
  SignUpStateSuccess();
}

class SignUpStateVerifying extends SignUpState {
  SignUpStateVerifying();
}

class SignUpStateVerified extends SignUpState {
  SignUpStateVerified();
}
