import 'package:coddr/data/repositories/platform_repository_impl.dart';
import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/no_params.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class FetchUserDetail extends Usecase<UserModel, NoParams> {
  final PlatformRepositoryImpl platformRepository;

  FetchUserDetail({this.platformRepository});

  @override
  Future<Either<AppError, UserModel>> call(params) async {
    return await platformRepository.fetchUserDetail();
  }
}
