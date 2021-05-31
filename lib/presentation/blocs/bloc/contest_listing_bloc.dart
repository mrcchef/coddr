import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/contest_entity.dart';
import 'package:coddr/domain/entities/no_params.dart';
import 'package:coddr/domain/usecases/get_cf_contest_list.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'contest_listing_event.dart';
part 'contest_listing_state.dart';

class ContestListingBloc
    extends Bloc<ContestListingEvent, ContestListingState> {
  GetCFContestList getCFContestList;

  ContestListingBloc({@required this.getCFContestList})
      : super(ContestListingInitial());

  @override
  Stream<ContestListingState> mapEventToState(
    ContestListingEvent event,
  ) async* {
    if (event is PlatformSelectedEvent) {
      yield ContestListFetchingState();

      GetCFContestList getCFContestList = getItInstance<GetCFContestList>();

      final eitherList = await getCFContestList(NoParams());
      yield eitherList.fold(
        (appError) =>
            ContestListErrorState(appErrorType: appError.appErrorType),
        (contestList) {
          print(contestList);
          return ContestListFetchedState(contestList: contestList);
        },
      );
    }
  }
}
