part of 'create_curated_contest_bloc.dart';

abstract class CreateCuratedContestEvent extends Equatable {
  const CreateCuratedContestEvent();

  @override
  List<Object> get props => [];
}

class CreateCuratedContestEventt extends CreateCuratedContestEvent {
  final CuratedContestModel curatedContestModel;

  CreateCuratedContestEventt({@required this.curatedContestModel});
}
