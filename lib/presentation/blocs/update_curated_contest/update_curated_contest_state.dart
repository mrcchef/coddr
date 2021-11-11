part of 'update_curated_contest_bloc.dart';

abstract class UpdateCuratedContestState extends Equatable {
  const UpdateCuratedContestState();

  @override
  List<Object> get props => [];
}

class UpdateCuratedContestInitial extends UpdateCuratedContestState {}

class CuratedContestUpdatedState extends UpdateCuratedContestState {}

class CuratedContestUpdatingState extends UpdateCuratedContestState {}

class CuratedContestErrorState extends UpdateCuratedContestState {
  final String message;

  CuratedContestErrorState(this.message);

  @override
  List<Object> get props => [message];
}
