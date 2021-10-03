import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coddr/domain/usecases/is_email_verified.dart';
import 'package:coddr/domain/usecases/update_is_email_verified.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'email_verification_event.dart';
part 'email_verification_state.dart';

class EmailVerificationBloc
    extends Bloc<EmailVerificationEvent, EmailVerificationState> {
  IsEmailVerified isEmailVerified;
  UpdateIsEmailVerified updateIsEmailVerified;
  EmailVerificationBloc({
    @required this.isEmailVerified,
    @required this.updateIsEmailVerified,
    Object verifyEmail,
  }) : super(EmailVerificationInitial());

  @override
  Stream<EmailVerificationState> mapEventToState(
    EmailVerificationEvent event,
  ) async* {
    if (event is VerifyEmailEvent) {
      yield EmailVerificationLoading();

      bool isVerified = await isEmailVerified();
      String uid = event.uid;
      if (isVerified) {
        await updateIsEmailVerified(uid);
        yield EmailVerificationDone();
      } else
        yield EmailVerificationFailed();
    }
  }
}
