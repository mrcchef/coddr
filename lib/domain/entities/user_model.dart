import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class UserModel extends Equatable {
  final String imageUrl;
  final String displayName;
  final String email;
  final String uid;
  final String contactNumber;
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
  final String institution;

  UserModel({
    this.imageUrl,
    @required this.email,
    @required this.uid,
    this.displayName,
    this.contactNumber,
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
    this.institution,
  });

  @override
  List<Object> get props {
    return [
      imageUrl,
      displayName,
      email,
      uid,
      contactNumber,
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
      institution,
    ];
  }

  UserModel copyWith({
    File image,
    String displayName,
    String email,
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
    String institution,
  }) {
    return UserModel(
      imageUrl: imageUrl ?? this.imageUrl,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      uid: uid ?? this.uid,
      contactNumber: contanctNumber ?? this.contactNumber,
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
      institution: institution ?? this.institution,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl' : imageUrl,
      'displayName': displayName,
      'email': email,
      'uid': uid,
      'contactNumber': contactNumber,
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
      'institution': institution,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      imageUrl: map['imageUrl'],
      displayName: map['displayName'],
      email: map['email'],
      uid: map['uid'],
      contactNumber: map['contanctNumber'],
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
      institution: map['institution'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;
}
