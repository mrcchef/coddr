part of 'participated_contest_bloc.dart';

abstract class ParticipatedContestEvent extends Equatable {
  const ParticipatedContestEvent();

  @override
  List<Object> get props => [];
}

class FetchParticipatedContestEvent extends ParticipatedContestEvent {
  final String uid;
  FetchParticipatedContestEvent({@required this.uid});

  List<Object> get props => [uid];
}
