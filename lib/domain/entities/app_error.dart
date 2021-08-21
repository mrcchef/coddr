import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum AppErrorType { api, database, network, authentication, firebase }

class AppError extends Equatable {
  final AppErrorType appErrorType;

  AppError({@required this.appErrorType});

  @override
  List<Object> get props => [appErrorType];
}
