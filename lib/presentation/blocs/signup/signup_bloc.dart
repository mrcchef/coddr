import 'package:bloc/bloc.dart';
import 'package:coddr/domain/entities/user_credentials.dart';
import 'package:coddr/domain/usecases/sign_up.dart';
import 'package:coddr/domain/usecases/verify_email.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUp signUp;
  VerifyEmail verifyEmail;
  // StoreUserCredentials storeUserCredentials;
  // Timer timer;

  SignUpBloc({
    @required this.signUp,
    // @required this.storeUserCredentials,
    @required this.verifyEmail,
  }) : super(SignUpStateEmpty()) {
    on<SignUpWithCredentialsPressedEvent>((event, emit) async {
      emit(SignUpStateLoding());

      final eitherResponse = await signUp(
          UserCredentials(email: event.email, password: event.password));

      final Map<String, String> authData = {
        'email': event.email,
        'password': event.password,
      };

      bool isSignUpSuccesss = false;

      eitherResponse.fold((appError) {
        isSignUpSuccesss = false;
      }, (r) {
        isSignUpSuccesss = true;
      });

      if (isSignUpSuccesss) {
        // await storeUserCredentials(authData);

        emit(SignUpStateSuccess(email: event.email));
      } else
        emit(SignUpStateFailure(message: "Sign Up Failed"));
    });
  }
}
