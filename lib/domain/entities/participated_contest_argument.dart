import 'package:coddr/domain/entities/participated_contest.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ParticipatedContestArgument extends Equatable {
  final String uid;
  final ParticipatedContestModel participatedContestModel;

  ParticipatedContestArgument({
    @required this.uid,
    @required this.participatedContestModel,
  });

  @override
  List<Object> get props => [uid, participatedContestModel];
}
