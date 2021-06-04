import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum AppErrorType { api, database, network, auth }

class AppError extends Equatable {
  final AppErrorType appErrorType;

  AppError({@required this.appErrorType});

  @override
  List<Object> get props => [appErrorType];
}
