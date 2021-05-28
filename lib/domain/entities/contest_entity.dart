import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ContestEntity extends Equatable {
  final int id;
  final String name;
  final String type;
  final String platformHandle;
  final String phase;
  final bool frozen;
  final int durationSeconds;
  final int startTimeSeconds;
  final int relativeTimeSeconds;

  ContestEntity({
    @required this.id,
    @required this.name,
    @required this.type,
    @required this.phase,
    @required this.frozen,
    @required this.platformHandle,
    @required this.durationSeconds,
    @required this.startTimeSeconds,
    @required this.relativeTimeSeconds,
  });

  @override
  List<Object> get props => [id, name];
}
