import 'package:bloc/bloc.dart';
import 'package:coddr/domain/entities/cf_standings_entity.dart';
import 'package:coddr/domain/entities/get_cf_standings_arguments.dart';
import 'package:coddr/domain/usecases/get_cf_standings.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'contest_standings_event.dart';
part 'contest_standings_state.dart';

class ContestStandingsBloc
    extends Bloc<ContestStandingsEvent, ContestStandingsState> {
  GetCFStandings getCFStandings;
  ContestStandingsBloc({@required this.getCFStandings})
      : super(ContestStandingsInitial()) {
    on<CFStandingsListing>((event, emit) async {
      emit(ContestStandingsFetching());
      final eitherList = await getCFStandings(event.getCFStandingsArguments);
      emit(eitherList.fold((appError) => ContestStandingsFailed(),
          (contestStandings) {
        return ContestStandingsFetched(
          cfStandings: contestStandings,
        );
      }));
    });
  }
}
