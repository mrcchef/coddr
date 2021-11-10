import 'package:coddr/data/repositories/platform_repository_impl.dart';
import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class UpdateUserModel extends Usecase<void, UserModel> {
  final PlatformRepositoryImpl platformRepository;

  UpdateUserModel({this.platformRepository});

  @override
  Future<Either<AppError, void>> call(userModel) async {
    return await platformRepository.updateUserModel(userModel);
  }
}
