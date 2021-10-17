import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'cf_handel_standings_entity.dart';

class CFStandingsEntity extends Equatable {
  final int contestId;
  final String contestName;
  final String phase;
  final int durationSeconds;
  final int startTimeSeconds;
  final int relativeTimeSeconds;
  final List<CFHandelStandingsEntity> cfHandelStandingsEntity;

  CFStandingsEntity({
    @required this.contestId,
    @required this.contestName,
    @required this.phase,
    @required this.durationSeconds,
    @required this.startTimeSeconds,
    @required this.relativeTimeSeconds,
    @required this.cfHandelStandingsEntity,
  });

  @override
  List<Object> get props => [contestId,contestName];
}
