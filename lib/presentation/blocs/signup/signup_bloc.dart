import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coddr/domain/entities/user_credentials.dart';
import 'package:coddr/domain/usecases/sign_up.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUp signUp;

  SignUpBloc({@required this.signUp}) : super(SignUpStateEmpty());

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    print(event);
    if (event is SignUpWithCredentialsPressedEvent) {
      yield* _mapSignUpWithCredentialsPressedToState(
        email: event.email,
        password: event.password,
        signUp: signUp,
      );
    }
  }

  Stream<SignUpState> _mapSignUpWithCredentialsPressedToState({
    String email,
    String password,
    SignUp signUp,
  }) async* {
    yield SignUpStateLoding();

    final eitherResponse =
        await signUp(UserCredentials(email: email, password: password));

    yield eitherResponse.fold(
        (l) => SignUpStateFaliure(), (r) => SignUpStateSuccess());
  }
}
