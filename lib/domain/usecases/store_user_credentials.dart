import 'package:coddr/data/repositories/platform_repository_impl.dart';
import 'package:coddr/domain/entities/app_error.dart';

import 'package:coddr/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class StoreUserCredentials extends Usecase<void, Map<String, String>> {
  final PlatformRepositoryImpl platformRepositoryImpl;

  StoreUserCredentials({this.platformRepositoryImpl});

  @override
  Future<Either<AppError, void>> call(authData) async {
    return await platformRepositoryImpl.storeUserCredentials(authData);
  }
}
