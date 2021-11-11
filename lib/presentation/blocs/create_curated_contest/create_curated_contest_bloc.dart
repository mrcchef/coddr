import 'package:bloc/bloc.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/domain/usecases/create_curated_contest.dart';
import 'package:coddr/domain/usecases/update_user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'create_curated_contest_event.dart';
part 'create_curated_contest_state.dart';

class CreateCuratedContestBloc
    extends Bloc<CreateCuratedContestEvent, CreateCuratedContestState> {
  CreateCuratedContest createCuratedContest;
  UpdateUserModel updateUserModel;

  CreateCuratedContestBloc({
    @required this.createCuratedContest,
    @required this.updateUserModel,
  }) : super(CreateCuratedContestInitial());

  @override
  Stream<CreateCuratedContestState> mapEventToState(
      CreateCuratedContestEvent event) async* {
    if (event is CreateCuratedContestEventt) {
      yield CreateCuratedContestLoadingState();

      final eitherResponse =
          await createCuratedContest(event.curatedContestModel);

      bool isCuratedContestCreated;

      isCuratedContestCreated = eitherResponse.fold(
        (appError) => false,
        (curatedContestList) => true,
      );

      if (!isCuratedContestCreated)
        yield CreateCuratedContestFailedState();
      else {
        final eitherResponse2 = await updateUserModel(event.userModel);
        isCuratedContestCreated &= eitherResponse2.fold(
          (appError) => false,
          (curatedContestList) => true,
        );

        if (isCuratedContestCreated)
          yield CreateCuratedContestSuccessState();
        else
          CreateCuratedContestFailedState();
      }
    }
  }
}
