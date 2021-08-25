import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class UserModel extends Equatable {
  final String displayName;
  final String emailId;
  final String uid;
  final String contanctNumber;
  final int coins;
  final int contest;
  final int wins;
  final String handelCF;
  final String handelATC;
  final String handelCC;
  final String handelHE;
  final String city;
  final String state;
  final String country;
  final String occupation;
  final String instition;

  UserModel({
    @required this.emailId,
    @required this.uid,
    this.displayName,
    this.contanctNumber,
    this.coins = 500,
    this.contest = 0,
    this.wins = 0,
    this.handelCF,
    this.handelATC,
    this.handelCC,
    this.handelHE,
    this.city,
    this.state,
    this.country,
    this.occupation,
    this.instition,
  });

  @override
  List<Object> get props {
    return [
      displayName,
      emailId,
      uid,
      contanctNumber,
      coins,
      contest,
      wins,
      handelCF,
      handelATC,
      handelCC,
      handelHE,
      city,
      state,
      country,
      occupation,
      instition,
    ];
  }

  UserModel copyWith({
    String displayName,
    String emailId,
    String uid,
    String contanctNumber,
    int coins,
    int contest,
    int wins,
    String handelCF,
    String handelATC,
    String handelCC,
    String handelHE,
    String city,
    String state,
    String country,
    String occupation,
    String instition,
  }) {
    return UserModel(
      displayName: displayName ?? this.displayName,
      emailId: emailId ?? this.emailId,
      uid: uid ?? this.uid,
      contanctNumber: contanctNumber ?? this.contanctNumber,
      coins: coins ?? this.coins,
      contest: contest ?? this.contest,
      wins: wins ?? this.wins,
      handelCF: handelCF ?? this.handelCF,
      handelATC: handelATC ?? this.handelATC,
      handelCC: handelCC ?? this.handelCC,
      handelHE: handelHE ?? this.handelHE,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      occupation: occupation ?? this.occupation,
      instition: instition ?? this.instition,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'emailId': emailId,
      'uid': uid,
      'contanctNumber': contanctNumber,
      'coins': coins,
      'contest': contest,
      'wins': wins,
      'handelCF': handelCF,
      'handelATC': handelATC,
      'handelCC': handelCC,
      'handelHE': handelHE,
      'city': city,
      'state': state,
      'country': country,
      'occupation': occupation,
      'instition': instition,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      displayName: map['displayName'],
      emailId: map['emailId'],
      uid: map['uid'],
      contanctNumber: map['contanctNumber'],
      coins: map['coins'],
      contest: map['contest'],
      wins: map['wins'],
      handelCF: map['handelCF'],
      handelATC: map['handelATC'],
      handelCC: map['handelCC'],
      handelHE: map['handelHE'],
      city: map['city'],
      state: map['state'],
      country: map['country'],
      occupation: map['occupation'],
      instition: map['instition'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;
}
