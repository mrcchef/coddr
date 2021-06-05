part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormValid => isEmailValid && isPasswordValid;

  LoginState({
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

class LoginStateEmpty extends LoginState {
  LoginStateEmpty()
      : super(
            isEmailValid: true,
            isPasswordValid: true,
            isFailure: false,
            isSubmitting: false,
            isSuccess: false);
}

class LoginStateLoding extends LoginState {
  LoginStateLoding()
      : super(
            isEmailValid: true,
            isPasswordValid: true,
            isFailure: false,
            isSubmitting: true,
            isSuccess: false);
}

class LoginStateFaliure extends LoginState {
  LoginStateFaliure()
      : super(
            isEmailValid: true,
            isPasswordValid: true,
            isFailure: true,
            isSubmitting: false,
            isSuccess: false);
}

class LoginStateSuccess extends LoginState {
  LoginStateSuccess()
      : super(
            isEmailValid: true,
            isPasswordValid: true,
            isFailure: false,
            isSubmitting: false,
            isSuccess: true);
}
