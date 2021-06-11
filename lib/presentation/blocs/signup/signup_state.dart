part of 'signup_bloc.dart';

abstract class SignUpState extends Equatable {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final bool isVerified;
  final bool isVerifying;

  bool get isFormValid => isEmailValid && isPasswordValid;

  SignUpState({
    @required this.isEmailValid,
    @required this.isPasswordValid,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
    @required this.isVerified,
    @required this.isVerifying,
  });

  @override
  List<Object> get props => [
        isEmailValid,
        isPasswordValid,
        isSubmitting,
        isSuccess,
        isFailure,
        isVerified,
        isVerifying,
      ];
}

class SignUpStateEmpty extends SignUpState {
  SignUpStateEmpty()
      : super(
          isEmailValid: true,
          isPasswordValid: true,
          isFailure: false,
          isSubmitting: false,
          isSuccess: false,
          isVerified: false,
          isVerifying: false,
        );
}

class SignUpStateLoding extends SignUpState {
  SignUpStateLoding()
      : super(
          isEmailValid: true,
          isPasswordValid: true,
          isFailure: false,
          isSubmitting: true,
          isSuccess: false,
          isVerified: false,
          isVerifying: false,
        );
}

class SignUpStateFailure extends SignUpState {
  SignUpStateFailure()
      : super(
          isEmailValid: true,
          isPasswordValid: true,
          isFailure: true,
          isSubmitting: false,
          isSuccess: false,
          isVerified: false,
          isVerifying: false,
        );
}

class SignUpStateSuccess extends SignUpState {
  SignUpStateSuccess()
      : super(
          isEmailValid: true,
          isPasswordValid: true,
          isFailure: false,
          isSubmitting: false,
          isSuccess: true,
          isVerified: true,
          isVerifying: false,
        );
}

class SignUpStateVerifying extends SignUpState {
  SignUpStateVerifying()
      : super(
          isEmailValid: true,
          isPasswordValid: true,
          isFailure: false,
          isSubmitting: false,
          isSuccess: false,
          isVerified: false,
          isVerifying: true,
        );
}

class SignUpStateVerified extends SignUpState {
  SignUpStateVerified()
      : super(
          isEmailValid: true,
          isPasswordValid: true,
          isFailure: false,
          isSubmitting: false,
          isSuccess: false,
          isVerified: true,
          isVerifying: false,
        );
}
