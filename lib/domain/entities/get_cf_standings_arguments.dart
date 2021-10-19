import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class GetCFStandingsArguments extends Equatable {
  final List<String> handles;
  final String contestId;

  GetCFStandingsArguments({@required this.handles,@required this.contestId});

  @override
  List<Object> get props => [contestId];
}
