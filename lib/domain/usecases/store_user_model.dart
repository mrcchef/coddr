import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/domain/repositories/platform_repository.dart';
import 'package:coddr/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class StoreUserModel extends Usecase<void, UserModel> {
  final PlatformRepository platformRepository;

  StoreUserModel({this.platformRepository});

  @override
  Future<Either<AppError, void>> call(userModel) async {
    return await platformRepository.storeUserModel(userModel);
  }
}
