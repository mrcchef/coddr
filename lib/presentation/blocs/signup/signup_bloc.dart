import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coddr/domain/entities/user_credentials.dart';
import 'package:coddr/domain/usecases/sign_up.dart';
import 'package:coddr/domain/usecases/store_user_credentials.dart';
import 'package:coddr/domain/usecases/verify_email.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUp signUp;
  VerifyEmail verifyEmail;
  StoreUserCredentials storeUserCredentials;
  Timer timer;

  SignUpBloc({
    @required this.signUp,
    @required this.storeUserCredentials,
    @required this.verifyEmail,
  }) : super(SignUpStateEmpty());

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    print(event);
    if (event is SignUpWithCredentialsPressedEvent) {
      yield* _mapSignUpWithCredentialsPressedToState(
        email: event.email,
        password: event.password,
        displayName: event.displayName,
        signUp: signUp,
        verifyEmail: verifyEmail,
      );
    }
  }

  Stream<SignUpState> _mapSignUpWithCredentialsPressedToState({
    String email,
    String password,
    String displayName,
    SignUp signUp,
    VerifyEmail verifyEmail,
  }) async* {
    yield SignUpStateLoding();
    print("sign up loading");

    final eitherResponse =
        await signUp(UserCredentials(email: email, password: password));
    print(eitherResponse);

    final Map<String, String> authData = {
      'email': email,
      'displayName': displayName,
      'password': password,
    };

    bool isSignUpSuccesss = false;

    eitherResponse.fold((appError) {
      isSignUpSuccesss = false;
    }, (r) {
      isSignUpSuccesss = true;
    });

    if (isSignUpSuccesss) {
      await storeUserCredentials(authData);
      yield SignUpStateSuccess();
    } else
      yield SignUpStateFailure(message: "Sign Up Failed");
  }
}
