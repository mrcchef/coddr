import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coddr/domain/entities/user_credentials.dart';
import 'package:coddr/domain/usecases/sign_in.dart';
import 'package:coddr/presentation/journeys/auth/validators.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  SignIn signIn;

  LoginBloc({this.signIn}) : super(LoginStateEmpty());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    print(event);
    if (event is LoginWithCredentialsPressedEvent) {
      yield* _mapLoginWithCredentialsPressedToState(
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

  Stream<LoginState> _mapLoginWithCredentialsPressedToState({
    String email,
    String password,
    SignIn signIn,
  }) async* {
    yield LoginStateLoding();

    final eitherResponse =
        await signIn(UserCredentials(email: email, password: password));

    yield eitherResponse.fold(
        (l) => LoginStateFaliure(), (r) => LoginStateSuccess());
  }
}
