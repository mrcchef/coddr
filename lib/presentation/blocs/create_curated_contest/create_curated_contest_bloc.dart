import 'package:bloc/bloc.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/domain/entities/participated_contest.dart';
import 'package:coddr/domain/entities/participated_contest_argument.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/domain/usecases/create_curated_contest.dart';
import 'package:coddr/domain/usecases/update_participated_contests.dart';
import 'package:coddr/domain/usecases/update_user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'create_curated_contest_event.dart';
part 'create_curated_contest_state.dart';

class CreateCuratedContestBloc
    extends Bloc<CreateCuratedContestEvent, CreateCuratedContestState> {
  CreateCuratedContest createCuratedContest;
  UpdateUserModel updateUserModel;
  UpdateParticipatedContests updateParticipatedContests;

  CreateCuratedContestBloc({
    @required this.createCuratedContest,
    @required this.updateParticipatedContests,
    @required this.updateUserModel,
  }) : super(CreateCuratedContestInitial()) {
    on<CreateCuratedContestEventt>((event, emit) async {
      emit(CreateCuratedContestLoadingState());

      final eitherResponse =
          await createCuratedContest(event.curatedContestModel);

      bool isCuratedContestCreated;

      isCuratedContestCreated = eitherResponse.fold(
        (appError) => false,
        (curatedContestList) => true,
      );

      if (!isCuratedContestCreated)
        emit(CreateCuratedContestFailedState());
      else {
        final eitherResponse2 = await updateUserModel(event.userModel);
        isCuratedContestCreated &= eitherResponse2.fold(
          (appError) => false,
          (curatedContestList) => true,
        );
        if (!isCuratedContestCreated)
          CreateCuratedContestFailedState();
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

          isCuratedContestCreated &=
              eitherResponse3.fold((l) => false, (r) => true);
          if (!isCuratedContestCreated)
            CreateCuratedContestFailedState();
          else
            emit(CreateCuratedContestSuccessState());
        }
      }
    });
  }
}
