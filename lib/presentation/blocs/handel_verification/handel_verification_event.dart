part of 'handel_verification_bloc.dart';

abstract class HandelVerificationEvent extends Equatable {
  const HandelVerificationEvent();

  @override
  List<Object> get props => [];
}

class VerifyCFHandelEvent extends HandelVerificationEvent {
  final String handel, email;

  VerifyCFHandelEvent({@required this.handel, @required this.email});

  @override
  List<Object> get props => [handel, email];
}
