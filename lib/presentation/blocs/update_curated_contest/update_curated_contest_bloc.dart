import 'package:bloc/bloc.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/domain/entities/participated_contest.dart';
import 'package:coddr/domain/entities/participated_contest_argument.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/domain/usecases/update_curated_contest.dart';
import 'package:coddr/domain/usecases/update_participated_contests.dart';
import 'package:coddr/domain/usecases/update_user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'update_curated_contest_event.dart';
part 'update_curated_contest_state.dart';

class UpdateCuratedContestBloc
    extends Bloc<UpdateCuratedContestEvent, UpdateCuratedContestState> {
  UpdateCuratedContest updateCuratedContest;
  UpdateUserModel updateUserModel;
  UpdateParticipatedContests updateParticipatedContests;

  UpdateCuratedContestBloc({
    @required this.updateCuratedContest,
    @required this.updateUserModel,
    @required this.updateParticipatedContests,
  }) : super(UpdateCuratedContestInitial()) {
    on<UpdateCuratedContestEventt>((event, emit) async {
      emit(CuratedContestUpdatingState());

      final eitherResponse =
          await updateCuratedContest(event.curatedContestModel);
      final eitherResponse2 = await updateUserModel(event.userModel);

      bool isUpdateCuratedContestSuccess =
          eitherResponse.fold((appError) => false, (r) => true);

      if (!isUpdateCuratedContestSuccess)
        emit(CuratedContestErrorState("Updation falied"));

      isUpdateCuratedContestSuccess &=
          eitherResponse2.fold((appError) => false, (r) => true);

      if (!isUpdateCuratedContestSuccess)
        emit(CuratedContestErrorState("Updation failed"));
      else {
        final eitherResponse3 = await updateParticipatedContests(
          ParticipatedContestArgument(
            uid: event.userModel.uid,
            participatedContestModel: ParticipatedContestModel(
              parentContestId: event.curatedContestModel.parentContestId,
              contestId: event.curatedContestModel.contestId,
              platformId: event.curatedContestModel.platformId,
            ),
          ),
        );

        isUpdateCuratedContestSuccess &=
            eitherResponse3.fold((l) => false, (r) => true);

        if (!isUpdateCuratedContestSuccess) {
          emit(CuratedContestErrorState("Updation failed"));
        } else
          emit(CuratedContestUpdatedState());
      }
    });
  }

  // @override
  // Stream<UpdateCuratedContestState> mapEventToState(
  //     UpdateCuratedContestEvent event) async* {
  //   if (event is UpdateCuratedContestEventt) {
  //     yield CuratedContestUpdatingState();

  //     final eitherResponse =
  //         await updateCuratedContest(event.curatedContestModel);
  //     final eitherResponse2 = await updateUserModel(event.userModel);

  //     bool isUpdateCuratedContestSuccess =
  //         eitherResponse.fold((appError) => false, (r) => true);

  //     if (!isUpdateCuratedContestSuccess)
  //       yield CuratedContestErrorState("Updation falied");

  //     isUpdateCuratedContestSuccess &=
  //         eitherResponse2.fold((appError) => false, (r) => true);

  //     if (!isUpdateCuratedContestSuccess)
  //       yield CuratedContestErrorState("Updation failed");
  //     else {
  //       final eitherResponse3 = await updateParticipatedContests(
  //         ParticipatedContestArgument(
  //           uid: event.userModel.uid,
  //           participatedContestModel: ParticipatedContestModel(
  //             parentContestId: event.curatedContestModel.parentContestId,
  //             contestId: event.curatedContestModel.contestId,
  //             platformId: event.curatedContestModel.platformId,
  //           ),
  //         ),
  //       );

  //       isUpdateCuratedContestSuccess &=
  //           eitherResponse3.fold((l) => false, (r) => true);

  //       if (!isUpdateCuratedContestSuccess) {
  //         yield CuratedContestErrorState("Updation failed");
  //       } else
  //         yield CuratedContestUpdatedState();
  //     }
  //   }
  // }
}
