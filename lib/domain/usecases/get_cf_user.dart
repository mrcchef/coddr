import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/user_entity.dart';
import 'package:coddr/domain/repositories/platform_repository.dart';
import 'package:coddr/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetCFUser extends Usecase<List<UserEntity>, List<String>> {
  final PlatformRepository platformRepository;

  GetCFUser({this.platformRepository});

  @override
  Future<Either<AppError, List<UserEntity>>> call(params) async {
    return await platformRepository.getCFUserList(params);
  }
}
