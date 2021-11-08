part of 'curated_contest_bloc.dart';

abstract class CuratedContestState extends Equatable {
  const CuratedContestState();

  @override
  List<Object> get props => [];
}

class CuratedContestInitial extends CuratedContestState {}

class CuratedContestFetchedState extends CuratedContestState {
  final List<CuratedContestModel> curatedContestList;

  CuratedContestFetchedState({@required this.curatedContestList});

  @override
  List<Object> get props => [curatedContestList];
}

class CuratedContestFetchingState extends CuratedContestState {}

class CuratedContestErrorState extends CuratedContestState {
  final String message;

  CuratedContestErrorState(this.message);

  @override
  List<Object> get props => [message];
}
