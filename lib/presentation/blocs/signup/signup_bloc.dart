import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coddr/domain/entities/user_credentials.dart';
import 'package:coddr/domain/usecases/sign_up.dart';
import 'package:coddr/domain/usecases/store_user_credentials.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUp signUp;
  StoreUserCredentials storeUserCredentials;

  SignUpBloc({
    @required this.signUp,
    @required this.storeUserCredentials,
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
        username: event.username,
        signUp: signUp,
      );
    }
  }

  Stream<SignUpState> _mapSignUpWithCredentialsPressedToState({
    String email,
    String password,
    String username,
    SignUp signUp,
  }) async* {
    yield SignUpStateLoding();

    final eitherResponse =
        await signUp(UserCredentials(email: email, password: password));

    yield eitherResponse.fold((l) => SignUpStateFaliure(), (r) {
      final Map<String, String> authData = {
        'email': email,
        'username': username,
        'password': password,
      };
      storeUserCredentials(authData);
      
      return SignUpStateSuccess();
    });
  }
}
