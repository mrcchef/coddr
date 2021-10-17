import 'package:equatable/equatable.dart';

class GetCFStandingsArguments extends Equatable {
  final List<String> handles;
  final String contestId;

  GetCFStandingsArguments({this.handles, this.contestId});

  @override
  List<Object> get props => [contestId];
}
