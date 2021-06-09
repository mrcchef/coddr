import 'package:coddr/data/repositories/platform_repository_impl.dart';
import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/user_entity.dart';
import 'package:coddr/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetCFUser extends Usecase<List<UserEntity>, List<String>> {
  final PlatformRepositoryImpl platformRepository;

  GetCFUser({this.platformRepository});

  @override
  Future<Either<AppError, List<UserEntity>>> call(params) async {
    return await platformRepository.getCFUserList(params);
  }
}