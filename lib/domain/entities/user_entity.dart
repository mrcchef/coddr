import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class UserEntity extends Equatable {
  final String firstName;
  final String lastName;
  final String handle;
  final String email;
  final String platformName;

  UserEntity({
    @required this.firstName,
    @required this.lastName,
    @required this.handle,
    @required this.email,
    @required this.platformName,
  });

  @override
  List<Object> get props => [handle, email];
}
