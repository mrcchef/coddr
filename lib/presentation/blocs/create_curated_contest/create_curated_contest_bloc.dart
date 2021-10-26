import 'package:bloc/bloc.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/domain/usecases/create_curated_contest.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'create_curated_contest_event.dart';
part 'create_curated_contest_state.dart';

class CreateCuratedContestBloc
    extends Bloc<CreateCuratedContestEvent, CreateCuratedContestState> {
  CreateCuratedContest createCuratedContest;

  CreateCuratedContestBloc({@required this.createCuratedContest})
      : super(CreateCuratedContestInitial());

  @override
  Stream<CreateCuratedContestState> mapEventToState(
      CreateCuratedContestEvent event) async* {
    if (event is CreateCuratedContestEventt) {
      yield CreateCuratedContestLoadingState();

      final eitherResponse =
          await createCuratedContest(event.curatedContestModel);

      yield eitherResponse.fold((appError) => CreateCuratedContestFailedState(),
          (curatedContestList) => CreateCuratedContestSuccessState());
    }
  }
}
