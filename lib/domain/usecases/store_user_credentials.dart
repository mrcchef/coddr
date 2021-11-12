import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/repositories/platform_repository.dart';
import 'package:coddr/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class StoreUserCredentials extends Usecase<void, Map<String, String>> {
  final PlatformRepository platformRepository;

  StoreUserCredentials({this.platformRepository});

  @override
  Future<Either<AppError, void>> call(authData) async {
    return await platformRepository.storeUserCredentials(authData);
  }
}
