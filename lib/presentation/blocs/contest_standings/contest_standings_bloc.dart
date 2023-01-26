import 'package:bloc/bloc.dart';
import 'package:coddr/domain/entities/cf_handel_standings_entity.dart';
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
        var hashMap = new Map();
        contestStandings.cfHandelStandingsEntity.forEach(
          (element) {
            hashMap[element.handle] = true;
          },
        );

        event.getCFStandingsArguments.handles.forEach(
          (element) {
            if (!hashMap.containsKey(element)) {
              contestStandings.cfHandelStandingsEntity.add(
                  CFHandelStandingsEntity(
                      handle: element,
                      rank: -1,
                      points: 0,
                      penalty: -1,
                      solvedProblems: 0));
            }
          },
        );

        return ContestStandingsFetched(
          cfStandings: contestStandings,
        );
      }));
    });
  }
}
