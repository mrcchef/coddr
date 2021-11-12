import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/no_params.dart';
import 'package:coddr/domain/repositories/platform_repository.dart';
import 'package:coddr/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends Usecase<void, NoParams> {
  final PlatformRepository platformRepository;

  VerifyEmail({@required this.platformRepository});
  @override
  Future<Either<AppError, void>> call(NoParams params) async {
    return await platformRepository.verifyEmail();
  }
}
