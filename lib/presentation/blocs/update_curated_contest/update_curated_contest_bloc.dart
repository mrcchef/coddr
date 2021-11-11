import 'package:bloc/bloc.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/domain/usecases/update_curated_contest.dart';
import 'package:coddr/domain/usecases/update_user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'update_curated_contest_event.dart';
part 'update_curated_contest_state.dart';

class UpdateCuratedContestBloc
    extends Bloc<UpdateCuratedContestEvent, UpdateCuratedContestState> {
  UpdateCuratedContest updateCuratedContest;
  UpdateUserModel updateUserModel;
  UpdateCuratedContestBloc({
    @required this.updateCuratedContest,
    @required this.updateUserModel,
  }) : super(UpdateCuratedContestInitial());

  @override
  Stream<UpdateCuratedContestState> mapEventToState(
      UpdateCuratedContestEvent event) async* {
    if (event is UpdateCuratedContestEventt) {
      yield CuratedContestUpdatingState();

      final eitherResponse =
          await updateCuratedContest(event.curatedContestModel);
      final eitherResponse2 = await updateUserModel(event.userModel);

      bool isUpdateCuratedContestSuccess =
          eitherResponse.fold((appError) => false, (r) => true);

      if (!isUpdateCuratedContestSuccess)
        yield CuratedContestErrorState("Updation falied");

      isUpdateCuratedContestSuccess &=
          eitherResponse2.fold((appError) => false, (r) => true);

      if (isUpdateCuratedContestSuccess)
        yield CuratedContestUpdatedState();
      else
        yield CuratedContestErrorState("Updation failed");
    }
  }
}
