import 'package:coddr/data/repositories/platform_repository_impl.dart';
import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/no_params.dart';
import 'package:coddr/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends Usecase<void, NoParams> {
  final PlatformRepositoryImpl platformRepositoryImpl;

  VerifyEmail({@required this.platformRepositoryImpl});
  @override
  Future<Either<AppError, void>> call(NoParams params) async {
    return await platformRepositoryImpl.verifyEmail();
  }
}
