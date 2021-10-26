import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CuratedContestModel extends Equatable {
  final String contestId;
  final int entryFees;
  final int prize;
  final int totalSpots;
  final int filledSpots;
  final bool isPrivate;
  final String password;
  final String parentContestId;
  final String platformId;
  final Map<String, int> positionToReward;
  final Map<String, String> positionToUsername;
  CuratedContestModel({
    @required this.contestId,
    @required this.entryFees,
    @required this.prize,
    @required this.totalSpots,
    @required this.filledSpots,
    @required this.isPrivate,
    @required this.password,
    @required this.parentContestId,
    @required this.platformId,
    @required this.positionToReward,
    @required this.positionToUsername,
  });

  CuratedContestModel copyWith({
    String contestId,
    String entryFees,
    String prize,
    String totalSpots,
    String filledSpots,
    bool isPrivate,
    String password,
    String parentContestId,
    String platformId,
    String positionToReward,
    String positionToUsername,
  }) {
    return CuratedContestModel(
      contestId: contestId ?? this.contestId,
      entryFees: entryFees ?? this.entryFees,
      prize: prize ?? this.prize,
      totalSpots: totalSpots ?? this.totalSpots,
      filledSpots: filledSpots ?? this.filledSpots,
      isPrivate: isPrivate ?? this.isPrivate,
      password: password ?? this.password,
      parentContestId: parentContestId ?? this.parentContestId,
      platformId: platformId ?? this.platformId,
      positionToReward: positionToReward ?? this.positionToReward,
      positionToUsername: positionToUsername ?? this.positionToUsername,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'contestId': contestId,
      'entryFees': entryFees,
      'prize': prize,
      'totalSpots': totalSpots,
      'filledSpots': filledSpots,
      'isPrivate': isPrivate,
      'password': password,
      'parentContestId': parentContestId,
      'platformId': platformId,
      'positionToReward': positionToReward,
      'positionToUsername': positionToUsername,
    };
  }

  factory CuratedContestModel.fromMap(Map<String, dynamic> map) {
    return CuratedContestModel(
      contestId: map['contestId'],
      entryFees: map['entryFees'],
      prize: map['prize'],
      totalSpots: map['totalSpots'],
      filledSpots: map['filledSpots'],
      isPrivate: map['isPrivate'],
      password: map['password'],
      parentContestId: map['parentContestId'],
      platformId: map['platformId'],
      positionToReward: Map<String, int>.from(map['positionToReward']),
      positionToUsername: Map<String, String>.from(map['positionToUsername']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CuratedContestModel.fromJson(String source) =>
      CuratedContestModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CuratedContestModel(contestId: $contestId, entryFees: $entryFees, prize: $prize, totalSpots: $totalSpots, filledSpots: $filledSpots, isPrivate: $isPrivate, password: $password, parentContestId: $parentContestId, platformId: $platformId,)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CuratedContestModel &&
        other.contestId == contestId &&
        other.entryFees == entryFees &&
        other.prize == prize &&
        other.totalSpots == totalSpots &&
        other.filledSpots == filledSpots &&
        other.isPrivate == isPrivate &&
        other.password == password &&
        other.parentContestId == parentContestId &&
        other.platformId == platformId &&
        other.positionToReward == positionToReward &&
        other.positionToUsername == positionToUsername;
  }

  @override
  int get hashCode {
    return contestId.hashCode ^
        entryFees.hashCode ^
        prize.hashCode ^
        totalSpots.hashCode ^
        filledSpots.hashCode ^
        isPrivate.hashCode ^
        password.hashCode ^
        parentContestId.hashCode ^
        platformId.hashCode ^
        positionToReward.hashCode ^
        positionToUsername.hashCode;
  }

  @override
  List<Object> get props => [parentContestId, contestId];
}
