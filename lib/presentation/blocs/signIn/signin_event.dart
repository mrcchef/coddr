part of 'signin_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

// class SubmittedEvent extends LoginEvent {
//   final String email, password;

//   SubmittedEvent({@required this.email, @required this.password});

//   @override
//   List<Object> get props => [email, password];
// }

class SignInWithCredentialsPressedEvent extends SignInEvent {
  final String email, password;

  SignInWithCredentialsPressedEvent(
      {@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}
