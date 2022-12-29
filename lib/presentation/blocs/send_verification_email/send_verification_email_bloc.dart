import 'package:bloc/bloc.dart';
import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/no_params.dart';
import 'package:coddr/domain/usecases/verify_email.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'send_verification_email_event.dart';
part 'send_verification_email_state.dart';

class SendVerificationEmailBloc
    extends Bloc<SendVerificationEmailEvent, SendVerificationEmailState> {
  VerifyEmail verifyEmail;
  SendVerificationEmailBloc({
    @required this.verifyEmail,
  }) : super(SendVerificationEmailInitial()) {
    on<SendVerificationEmail>((event, emit) async {
      emit(SendVerificationEmailLoading());

      final eitherResponse = await verifyEmail(NoParams());

      emit(eitherResponse.fold(
          (error) =>
              SendVerificationEmailFailed(appErrorType: error.appErrorType),
          (r) => SendVerificationEmailSuccess()));
    });
  }
}
