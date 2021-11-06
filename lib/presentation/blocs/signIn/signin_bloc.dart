import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coddr/domain/entities/user_credentials.dart';
import 'package:coddr/domain/usecases/sign_in.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignIn signIn;

  SignInBloc({this.signIn}) : super(SignInStateEmpty());

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    if (event is SignInWithCredentialsPressedEvent) {
      yield* _mapSignInWithCredentialsPressedToState(
        email: event.email,
        password: event.password,
        signIn: signIn,
      );
    }
  }

  // Stream<LoginState> _mapEmailChangedToState(String email) async* {
  //   yield LoginStateUpdateEmail(
  //     isEmailValid: Validators.isValidEmail(email),
  //   );
  // }

  // Stream<LoginState> _mapPasswordChangedToState(String password) async* {
  //   yield LoginStateUpdatePassword(
  //     isPasswordValid: Validators.isValidPassword(password),
  //   );
  // }

  Stream<SignInState> _mapSignInWithCredentialsPressedToState({
    String email,
    String password,
    SignIn signIn,
  }) async* {
    yield SignInStateLoding();

    final eitherResponse =
        await signIn(UserCredentials(email: email, password: password));

    yield eitherResponse.fold(
        (l) => SignInStateFaliure(message: "Logined Failed"),
        (r) => SignInStateSuccess());
  }
}
