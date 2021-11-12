import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/update_is_Handle_Verified_argument.dart';
import 'package:coddr/domain/repositories/platform_repository.dart';
import 'package:coddr/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class UpdateIsHandleVerified
    extends Usecase<void, UpdateIsHandleCFVerifiedArgument> {
  PlatformRepository platformRepository;

  UpdateIsHandleVerified({@required this.platformRepository});

  Future<Either<AppError, void>> call(updateIsHandleCFVerifiedArgument) async {
    return platformRepository.updateIsHandleVerified(
        updateIsHandleCFVerifiedArgument.uid,
        updateIsHandleCFVerifiedArgument.platformId);
  }
}
