import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class CFHandelStandingsEntity extends Equatable {
  final String handle;
  final int rank;
  final int points;
  final int penalty;
  final int solvedProblems;

  CFHandelStandingsEntity({
    @required this.handle,
    @required this.rank,
    @required this.points,
    @required this.penalty,
    @required this.solvedProblems,
  });

  @override
  List<Object> get props => [handle, rank];
}
