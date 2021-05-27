import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CFContestEntity extends Equatable {
  int id;
  String name;
  String type;
  String phase;
  bool frozen;
  int durationSeconds;
  int startTimeSeconds;
  int relativeTimeSeconds;

  CFContestEntity({
    @required this.id,
    @required this.name,
    @required this.type,
    @required this.phase,
    @required this.frozen,
    @required this.durationSeconds,
    @required this.startTimeSeconds,
    @required this.relativeTimeSeconds,
  });

  @override
  // TODO: implement props
  List<Object> get props => [id, name];
}
