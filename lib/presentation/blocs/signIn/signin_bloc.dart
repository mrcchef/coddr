import 'package:bloc/bloc.dart';
import 'package:coddr/domain/entities/user_credentials.dart';
import 'package:coddr/domain/usecases/sign_in.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignIn signIn;

  SignInBloc({this.signIn}) : super(SignInStateEmpty()) {
    on<SignInWithCredentialsPressedEvent>((event, emit) async {
      emit(SignInStateLoding());

      final eitherResponse = await signIn(
          UserCredentials(email: event.email, password: event.password));

      emit(eitherResponse.fold(
          (l) => SignInStateFaliure(message: "Logined Failed"),
          (r) => SignInStateSuccess()));
    });
  }
}
