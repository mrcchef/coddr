import 'package:bloc/bloc.dart';
import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/cf_standings_entity.dart';
import 'package:coddr/domain/entities/get_cf_standings_arguments.dart';
import 'package:coddr/domain/entities/no_params.dart';
import 'package:coddr/domain/usecases/get_cf_standings.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'contest_standings_event.dart';
part 'contest_standings_state.dart';

class ContestStandingsBloc
    extends Bloc<ContestStandingsEvent, ContestStandingsState> {
  GetCFStandings getCFStandings;
  ContestStandingsBloc({@required this.getCFStandings})
      : super(ContestStandingsInitial());

  @override
  Stream<ContestStandingsState> mapEventToState(
      ContestStandingsEvent event) async* {
    if (event is CFStandingsListing) {
      yield ContestStandingsFetching();
      final eitherList = await getCFStandings(event.getCFStandingsArguments);
      yield eitherList.fold((appError) => ContestStandingsFailed(),
          (contestStandings) {
        print(contestStandings);
        return ContestStandingsFetched(
          cfStandings: contestStandings,
        );
      });
    }
  }
}
