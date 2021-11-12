import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/repositories/platform_repository.dart';
import 'package:coddr/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class UpdateIsEmailVerified extends Usecase<void, String> {
  PlatformRepository platformRepository;

  UpdateIsEmailVerified({@required this.platformRepository});

  Future<Either<AppError, void>> call(String uid) async {
    return platformRepository.updateIsEmailVerified(uid);
  }
}
