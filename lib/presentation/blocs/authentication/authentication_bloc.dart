import 'dart:async';

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
  IsSignedIn isSignedIn;
  GetEmailId getEmailId;
  SignOut signOut;

  AuthenticationBloc({
    @required this.isSignedIn,
    @required this.getEmailId,
    @required this.signOut,
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
        yield UnAuthenticated();
      }
    } else if (event is SiggnedInEvent) {
      final String email = getEmailId();
      print(email);
      yield Authenticated(email: email);
    } else if (event is SiggnedOutEvent) {
      yield UnAuthenticated();
      signOut(NoParams());
    }
  }
}
