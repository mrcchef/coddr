part of 'create_curated_contest_bloc.dart';

abstract class CreateCuratedContestState extends Equatable {
  const CreateCuratedContestState();

  @override
  List<Object> get props => [];
}

class CreateCuratedContestInitial extends CreateCuratedContestState {}

class CreateCuratedContestSuccessState extends CreateCuratedContestState {}

class CreateCuratedContestFailedState extends CreateCuratedContestState {}

class CreateCuratedContestLoadingState extends CreateCuratedContestState {}
