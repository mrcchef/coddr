part of 'contest_standings_bloc.dart';

abstract class ContestStandingsEvent extends Equatable {
  const ContestStandingsEvent();

  @override
  List<Object> get props => [];
}

class CFStandingsListing extends ContestStandingsEvent {
  final GetCFStandingsArguments getCFStandingsArguments;
  CFStandingsListing({@required this.getCFStandingsArguments});

  @override
  List<Object> get props => [getCFStandingsArguments];
}
