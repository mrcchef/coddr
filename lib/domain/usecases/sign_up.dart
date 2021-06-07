import 'package:coddr/data/repositories/platform_repository_impl.dart';
import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/user_credentials.dart';
import 'package:coddr/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class SignUp extends Usecase<bool, UserCredentials> {
  PlatformRepositoryImpl platformRepositoryImpl;

  SignUp({@required this.platformRepositoryImpl});

  @override
  Future<Either<AppError, bool>> call(UserCredentials params) async {
    return platformRepositoryImpl.signUp(params.email, params.password);
  }
}
