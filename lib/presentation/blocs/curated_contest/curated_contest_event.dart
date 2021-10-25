part of 'curated_contest_bloc.dart';

abstract class CuratedContestEvent extends Equatable {
  const CuratedContestEvent();

  @override
  List<Object> get props => [];
}

class FetchCuratedContestEvent extends CuratedContestEvent {
  final FetchCuratedContestArgument fetchCuratedContestArgument;

  FetchCuratedContestEvent({
    @required this.fetchCuratedContestArgument,
  });

  @override
  List<Object> get props => [fetchCuratedContestArgument];
}
