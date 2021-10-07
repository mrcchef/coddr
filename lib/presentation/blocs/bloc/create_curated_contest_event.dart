part of 'create_curated_contest_bloc.dart';

abstract class CreateCuratedContestEvent extends Equatable {
  const CreateCuratedContestEvent();

  @override
  List<Object> get props => [];
}

class CreateCuratedContest extends CreateCuratedContestEvent {
  final CuratedContestModel curatedContestModel;

  CreateCuratedContest({@required this.curatedContestModel});
}
