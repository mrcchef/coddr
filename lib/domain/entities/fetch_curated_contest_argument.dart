import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class FetchCuratedContestArgument extends Equatable {
  final int contestId;
  final String platfromId;

  FetchCuratedContestArgument({
    @required this.contestId,
    @required this.platfromId,
  });

  @override
  List<Object> get props => [contestId, platfromId];
}
