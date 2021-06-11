part of 'signin_bloc.dart';

abstract class SignInState extends Equatable {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormValid => isEmailValid && isPasswordValid;

  SignInState({
    @required this.isEmailValid,
    @required this.isPasswordValid,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
  });

  @override
  List<Object> get props =>
      [isEmailValid, isPasswordValid, isSubmitting, isSuccess, isFailure];
}

class SignInStateEmpty extends SignInState {
  SignInStateEmpty()
      : super(
            isEmailValid: true,
            isPasswordValid: true,
            isFailure: false,
            isSubmitting: false,
            isSuccess: false);
}

class SignInStateLoding extends SignInState {
  SignInStateLoding()
      : super(
            isEmailValid: true,
            isPasswordValid: true,
            isFailure: false,
            isSubmitting: true,
            isSuccess: false);
}

class SignInStateFaliure extends SignInState {
  final String message;
  SignInStateFaliure({@required this.message})
      : super(
            isEmailValid: true,
            isPasswordValid: true,
            isFailure: true,
            isSubmitting: false,
            isSuccess: false);
  List<Object> get props => [message];
}

class SignInStateSuccess extends SignInState {
  SignInStateSuccess()
      : super(
            isEmailValid: true,
            isPasswordValid: true,
            isFailure: false,
            isSubmitting: false,
            isSuccess: true);
}
