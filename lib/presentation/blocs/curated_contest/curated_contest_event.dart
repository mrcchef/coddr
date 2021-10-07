part of 'curated_contest_bloc.dart';

abstract class CuratedContestEvent extends Equatable {
  const CuratedContestEvent();

  @override
  List<Object> get props => [];
}

class FetchCuratedContestEvent extends CuratedContestEvent {
  final ContestEntity contestEntity;

  FetchCuratedContestEvent({
    @required this.contestEntity,
  });

  @override
  List<Object> get props => [contestEntity];
}
