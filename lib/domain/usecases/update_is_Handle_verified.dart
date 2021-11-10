import 'package:coddr/data/repositories/platform_repository_impl.dart';
import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/update_is_Handle_Verified_argument.dart';
import 'package:coddr/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class UpdateIsHandleVerified
    extends Usecase<void, UpdateIsHandleCFVerifiedArgument> {
  PlatformRepositoryImpl platformRepositoryImpl;

  UpdateIsHandleVerified({@required this.platformRepositoryImpl});

  Future<Either<AppError, void>> call(updateIsHandleCFVerifiedArgument) async {
    return platformRepositoryImpl.updateIsHandleVerified(
        updateIsHandleCFVerifiedArgument.uid,
        updateIsHandleCFVerifiedArgument.platformId);
  }
}
