import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/user_credentials.dart';
import 'package:coddr/domain/repositories/platform_repository.dart';
import 'package:coddr/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class SignIn extends Usecase<bool, UserCredentials> {
  PlatformRepository platformRepository;

  SignIn({@required this.platformRepository});

  @override
  Future<Either<AppError, bool>> call(UserCredentials userCredentials) async {
    return platformRepository.signIn(
        userCredentials.email, userCredentials.password);
  }
}
