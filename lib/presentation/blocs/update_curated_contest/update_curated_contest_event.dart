part of 'update_curated_contest_bloc.dart';

abstract class UpdateCuratedContestEvent extends Equatable {
  const UpdateCuratedContestEvent();

  @override
  List<Object> get props => [];
}

class UpdateCuratedContestEventt extends UpdateCuratedContestEvent {
  final CuratedContestModel curatedContestModel;
  final UserModel userModel;

  UpdateCuratedContestEventt({
    @required this.curatedContestModel,
    @required this.userModel,
  });

  @override
  List<Object> get props => [curatedContestModel, userModel];
}
