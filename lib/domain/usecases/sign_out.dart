import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/no_params.dart';
import 'package:coddr/domain/repositories/platform_repository.dart';
import 'package:coddr/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class SignOut extends Usecase<bool, NoParams> {
  PlatformRepository platformRepository;

  SignOut({@required this.platformRepository});

  @override
  Future<Either<AppError, bool>> call(NoParams noparams) async {
    return platformRepository.signOut();
  }
}
