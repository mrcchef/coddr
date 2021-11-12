import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ParticipatedContestModel extends Equatable {
  final String contestId;
  final String parentContestId;
  final String platformId;

  ParticipatedContestModel({
    @required this.contestId,
    @required this.parentContestId,
    @required this.platformId,
  });

  @override
  List<Object> get props => [contestId, parentContestId, platformId];

  ParticipatedContestModel copyWith({
    String contestId,
    String parentContestId,
    String platformId,
  }) {
    return ParticipatedContestModel(
      contestId: contestId ?? this.contestId,
      parentContestId: parentContestId ?? this.parentContestId,
      platformId: platformId ?? this.platformId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'contestId': contestId,
      'parentContestId': parentContestId,
      'platformId': platformId,
    };
  }

  factory ParticipatedContestModel.fromMap(Map<String, dynamic> map) {
    return ParticipatedContestModel(
      contestId: map['contestId'],
      parentContestId: map['parentContestId'],
      platformId: map['platformId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ParticipatedContestModel.fromJson(String source) =>
      ParticipatedContestModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;
}
