import 'package:bloc/bloc.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/domain/entities/participated_contest.dart';
import 'package:coddr/domain/usecases/fetch_curated_contest.dart';
import 'package:coddr/domain/usecases/fetch_participated_contests.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'participated_contest_event.dart';
part 'participated_contest_state.dart';

class ParticipatedContestBloc
    extends Bloc<ParticipatedContestEvent, ParticipatedContestState> {
  FetchParticipatedContests fetchParticipatedContests;
  FetchCuratedContest fetchCuratedContest;

  ParticipatedContestBloc({
    @required this.fetchCuratedContest,
    @required this.fetchParticipatedContests,
  }) : super(ParticipatedContestInitial());

  @override
  Stream<ParticipatedContestState> mapEventToState(
      ParticipatedContestEvent event) async* {
    if (event is FetchParticipatedContestEvent) {
      yield ParticipatedContestLoadingState();

      List<ParticipatedContestModel> participatedContestList;
      final eitherResponse = await fetchParticipatedContests(event.uid);
      bool isSuccess = eitherResponse.fold((l) => false, (r) {
        participatedContestList = r;
        return true;
      });

      if (!isSuccess) {
        yield ParticipatedContestFailedState(
            "Participated Contest list failed to fetch");
      } else {
        List<CuratedContestModel> curatedContestModelList = [];

        bool check = true;
        for (int i = 0; i < participatedContestList.length; i++) {
          final eitherResponse2 =
              await fetchCuratedContest(participatedContestList[i]);

          check |= eitherResponse2.fold((l) => false, (curatedContestModel) {
            curatedContestModelList.add(curatedContestModel);
            return true;
          });

          if (!check) {
            break;
          }
        }

        if (!check)
          yield ParticipatedContestFailedState(
              "Curated Contest model list failed to fetch");
        else
          yield ParticipatedContestSuccessState(
              curatedContestModelList: curatedContestModelList);
      }
    }
  }
}
