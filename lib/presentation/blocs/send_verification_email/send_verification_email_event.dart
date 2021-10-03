part of 'send_verification_email_bloc.dart';

abstract class SendVerificationEmailEvent extends Equatable {
  const SendVerificationEmailEvent();

  @override
  List<Object> get props => [];
}

class SendVerificationEmail extends SendVerificationEmailEvent {
  final String uid;

  SendVerificationEmail({@required this.uid});
}
