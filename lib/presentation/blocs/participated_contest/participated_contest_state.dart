part of 'participated_contest_bloc.dart';

abstract class ParticipatedContestState extends Equatable {
  const ParticipatedContestState();

  @override
  List<Object> get props => [];
}

class ParticipatedContestInitial extends ParticipatedContestState {}

class ParticipatedContestLoadingState extends ParticipatedContestState {}

class ParticipatedContestSuccessState extends ParticipatedContestState {
  final List<CuratedContestModel> curatedContestModelList;

  ParticipatedContestSuccessState({
    @required this.curatedContestModelList,
  });

  @override
  List<Object> get props => [curatedContestModelList];
}

class ParticipatedContestFailedState extends ParticipatedContestState {
  final String message;

  ParticipatedContestFailedState(this.message);
  @override
  List<Object> get props => [message];
}
