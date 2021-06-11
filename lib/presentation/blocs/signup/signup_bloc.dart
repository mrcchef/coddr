import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coddr/domain/entities/no_params.dart';
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
        username: event.username,
        signUp: signUp,
        verifyEmail: verifyEmail,
      );
    }
  }

  Stream<SignUpState> _mapSignUpWithCredentialsPressedToState({
    String email,
    String password,
    String username,
    SignUp signUp,
    VerifyEmail verifyEmail,
  }) async* {
    yield SignUpStateLoding();
    print("sign up loading");

    final eitherResponse =
        await signUp(UserCredentials(email: email, password: password));
    print(eitherResponse);
    eitherResponse.fold((l) async* {
      print("failed");
      yield SignUpStateFailure();
    }, (r) async* {
      print("email created");
      yield SignUpStateVerifying();
      final eitherResponse2 = await verifyEmail(NoParams());

      eitherResponse2.fold((l) async* {
        print("verification failed");
        yield SignUpStateFailure();
      }, (r) async* {
        print("storing user data");
        final Map<String, String> authData = {
          'email': email,
          'username': username,
          'password': password,
        };
        final eitherResponse3 = await storeUserCredentials(authData);
        eitherResponse3.fold((l) async* {
          print("storing failed");
          yield SignUpStateFailure();
        }, (r) async* {
          print("signup sucess");
          yield SignUpStateSuccess();
        });
      });
    });
  }
}
