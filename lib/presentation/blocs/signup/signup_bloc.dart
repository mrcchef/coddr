import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/domain/entities/no_params.dart';
import 'package:coddr/domain/entities/user_credentials.dart';
import 'package:coddr/domain/usecases/sign_up.dart';
import 'package:coddr/domain/usecases/store_user_credentials.dart';
import 'package:coddr/domain/usecases/verify_email.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    final bool isEmailCreated = await eitherResponse.fold((l) {
      print("failed");
      return false;
    }, (r) {
      print("email created");
      return true;
    });

    if (!isEmailCreated)
      yield SignUpStateFailure();
    else {
      yield SignUpStateVerifying();
      final eitherResponseVerifyEmail = await verifyEmail(NoParams());

      final bool isVerificationEmailSent = eitherResponseVerifyEmail.fold((l) {
        return false;
      }, (r) {
        return true;
      });

      if (!isVerificationEmailSent) {
        yield SignUpStateFailure();
      } else {
        bool isEmailVerified = false;
        FirebaseAuth firebaseAuth = FirebaseAuth.instance;

        DateTime startTime = DateTime.now();
        DateTime endTime = startTime.add(new Duration(seconds: 60));

        timer = Timer.periodic(
          new Duration(seconds: 5),
          (timer) {
            firebaseAuth.currentUser.reload();
            if (firebaseAuth.currentUser.emailVerified) {
              isEmailVerified = true;
              timer.cancel();
            }
            if (DateTime.now().isAfter(endTime)) {
              isEmailVerified = false;
              timer.cancel();
            }
          },
        );

        if (!isEmailVerified)
          yield SignUpStateFailure();
        else {
          final Map<String, String> authData = {
            'email': email,
            'username': username,
            'password': password,
          };
          final eitherResponseStoreUser = await storeUserCredentials(authData);
          final bool isStored =
              eitherResponseStoreUser.fold((l) => false, (r) => true);

          if (!isStored) {
            yield SignUpStateFailure();
          } else {
            print("success");
            yield SignUpStateSuccess();
          }
        }
      }
    }
  }
}
