import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/user_credentials.dart';
import 'package:coddr/domain/repositories/platform_repository.dart';
import 'package:coddr/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class SignUp extends Usecase<bool, UserCredentials> {
  PlatformRepository platformRepository;

  SignUp({@required this.platformRepository});

  @override
  Future<Either<AppError, bool>> call(UserCredentials params) async {
    return platformRepository.signUp(params.email, params.password);
  }
}
