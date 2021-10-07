import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CuratedContestModel extends Equatable {
  final String contestId;
  final String entryFees;
  final String prize;
  final String totalSpots;
  final String filledSports;
  final bool isPrivate;
  final String password;
  final String parentContestId;
  final String platformId;
  CuratedContestModel({
    @required this.contestId,
    @required this.entryFees,
    @required this.prize,
    @required this.totalSpots,
    @required this.filledSports,
    @required this.isPrivate,
    @required this.password,
    @required this.parentContestId,
    @required this.platformId,
  });

  CuratedContestModel copyWith({
    String contestId,
    String entryFees,
    String prize,
    String totalSpots,
    String filledSports,
    bool isPrivate,
    String password,
    String parentContestId,
    String platformId,
  }) {
    return CuratedContestModel(
      contestId: contestId ?? this.contestId,
      entryFees: entryFees ?? this.entryFees,
      prize: prize ?? this.prize,
      totalSpots: totalSpots ?? this.totalSpots,
      filledSports: filledSports ?? this.filledSports,
      isPrivate: isPrivate ?? this.isPrivate,
      password: password ?? this.password,
      parentContestId: parentContestId ?? this.parentContestId,
      platformId: platformId ?? this.platformId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'contestId': contestId,
      'entryFees': entryFees,
      'prize': prize,
      'totalSpots': totalSpots,
      'filledSports': filledSports,
      'isPrivate': isPrivate,
      'password': password,
      'parentContestId': parentContestId,
      'platformId': platformId,
    };
  }

  factory CuratedContestModel.fromMap(Map<String, dynamic> map) {
    return CuratedContestModel(
      contestId: map['contestId'],
      entryFees: map['entryFees'],
      prize: map['prize'],
      totalSpots: map['totalSpots'],
      filledSports: map['filledSports'],
      isPrivate: map['isPrivate'],
      password: map['password'],
      parentContestId: map['parentContestId'],
      platformId: map['platformId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CuratedContestModel.fromJson(String source) =>
      CuratedContestModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CuratedContestModel(contestId: $contestId, entryFees: $entryFees, prize: $prize, totalSpots: $totalSpots, filledSports: $filledSports, isPrivate: $isPrivate, password: $password, parentContestId: $parentContestId, platformId: $platformId,)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CuratedContestModel &&
        other.contestId == contestId &&
        other.entryFees == entryFees &&
        other.prize == prize &&
        other.totalSpots == totalSpots &&
        other.filledSports == filledSports &&
        other.isPrivate == isPrivate &&
        other.password == password &&
        other.parentContestId == parentContestId &&
        other.platformId == platformId;
  }

  @override
  int get hashCode {
    return contestId.hashCode ^
        entryFees.hashCode ^
        prize.hashCode ^
        totalSpots.hashCode ^
        filledSports.hashCode ^
        isPrivate.hashCode ^
        password.hashCode ^
        parentContestId.hashCode ^
        platformId.hashCode;
  }

  @override
  List<Object> get props => [parentContestId, contestId];
}
