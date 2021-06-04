import 'dart:async';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:coddr/domain/entities/no_params.dart';
import 'package:coddr/domain/usecases/get_emailId.dart';
import 'package:coddr/domain/usecases/is_signed_in.dart';
import 'package:coddr/domain/usecases/sign_in.dart';
import 'package:coddr/domain/usecases/sign_out.dart';
import 'package:coddr/domain/usecases/sign_up.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  SignIn signIn;
  SignOut signOut;
  SignUp signUp;
  IsSignedIn isSignedIn;
  GetEmailId getEmailId;

  AuthenticationBloc({
    @required this.signIn,
    @required this.signOut,
    @required this.isSignedIn,
    @required this.signUp,
    @required this.getEmailId,
  }) : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStartedEvent) {
      final bool check = isSignedIn();
      if (check) {
        final String email = getEmailId();
        yield Authenticated(email: email);
      } else {
        UnAuthenticated();
      }
    } else if (event is SiggnedInEvent) {
      final String email = getEmailId();
      yield Authenticated(email: email);
    } else if (event is SiggnedOutEvent) {
      yield UnAuthenticated();
      signOut(NoParams());
    }
  }
}
