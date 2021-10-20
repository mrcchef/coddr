part of 'contest_standings_bloc.dart';

abstract class ContestStandingsState extends Equatable {
  const ContestStandingsState();

  @override
  List<Object> get props => [];
}

class ContestStandingsInitial extends ContestStandingsState {}

class ContestStandingsFetching extends ContestStandingsState {}

class ContestStandingsFetched extends ContestStandingsState {
  final CFStandingsEntity cfStandings;
  ContestStandingsFetched({@required this.cfStandings});
  List<Object> get props => [cfStandings];
}

class ContestStandingsFailed extends ContestStandingsState {}
