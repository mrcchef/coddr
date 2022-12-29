import 'package:bloc/bloc.dart';
import 'package:coddr/domain/usecases/get_emailId.dart';
import 'package:coddr/domain/usecases/is_signed_in.dart';
import 'package:coddr/domain/usecases/sign_out.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/entities/no_params.dart';

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
  }) : super(AuthenticationInitial()) {
    on<AppStartedEvent>((event, emit) {
      final bool check = isSignedIn();
      if (check) {
        final String email = getEmailId();
        emit(Authenticated(email: email));
      } else {
        emit(UnAuthenticated());
      }
    });

    on<SiggnedInEvent>(((event, emit) {
      final String email = getEmailId();

      emit(Authenticated(email: email));
    }));

    on<SiggnedOutEvent>((event, emit) {
      emit(UnAuthenticated());
      signOut(NoParams());
    });
  }
}
