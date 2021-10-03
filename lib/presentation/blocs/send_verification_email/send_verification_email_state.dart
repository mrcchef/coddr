part of 'send_verification_email_bloc.dart';

abstract class SendVerificationEmailState extends Equatable {
  const SendVerificationEmailState();

  @override
  List<Object> get props => [];
}

class SendVerificationEmailInitial extends SendVerificationEmailState {}

class SendVerificationEmailLoading extends SendVerificationEmailState {}

class SendVerificationEmailFailed extends SendVerificationEmailState {
  final AppErrorType appErrorType;

  SendVerificationEmailFailed({@required this.appErrorType});
}

class SendVerificationEmailSuccess extends SendVerificationEmailState {}
