import 'package:coddr/data/repositories/platform_repository_impl.dart';
import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class UpdateIsEmailVerified extends Usecase<void, String> {
  PlatformRepositoryImpl platformRepositoryImpl;

  UpdateIsEmailVerified({@required this.platformRepositoryImpl});

  Future<Either<AppError, void>> call(String uid) async {
    return platformRepositoryImpl.updateIsEmailVerified(uid);
  }
}
