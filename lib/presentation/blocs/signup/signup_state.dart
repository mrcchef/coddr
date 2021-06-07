part of 'signup_bloc.dart';

abstract class SignUpState extends Equatable {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormValid => isEmailValid && isPasswordValid;

  SignUpState({
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

class SignUpStateEmpty extends SignUpState {
  SignUpStateEmpty()
      : super(
            isEmailValid: true,
            isPasswordValid: true,
            isFailure: false,
            isSubmitting: false,
            isSuccess: false);
}

class SignUpStateLoding extends SignUpState {
  SignUpStateLoding()
      : super(
            isEmailValid: true,
            isPasswordValid: true,
            isFailure: false,
            isSubmitting: true,
            isSuccess: false);
}

class SignUpStateFaliure extends SignUpState {
  SignUpStateFaliure()
      : super(
            isEmailValid: true,
            isPasswordValid: true,
            isFailure: true,
            isSubmitting: false,
            isSuccess: false);
}

class SignUpStateSuccess extends SignUpState {
  SignUpStateSuccess()
      : super(
            isEmailValid: true,
            isPasswordValid: true,
            isFailure: false,
            isSubmitting: false,
            isSuccess: true);
}
