import 'package:coddr/data/data_sources/authentication_data_source.dart';
import 'package:coddr/data/data_sources/remote_data_source.dart';
import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/contest_entity.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/domain/entities/user_entity.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/domain/repositories/platform_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class PlatformRepositoryImpl extends PlatformRepository {
  RemoteDataSourceImpl remoteDataSourceImpl;
  AuthenticationDataSourceImpl authenticationDataSourceImpl;

  PlatformRepositoryImpl(
      {@required this.remoteDataSourceImpl,
      @required this.authenticationDataSourceImpl});

  @override
  Future<Either<AppError, List<ContestEntity>>> getCFContestList() async {
    try {
      List<ContestEntity> contestList =
          await remoteDataSourceImpl.getCFContest();
      return Right(contestList);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, bool>> signIn(String email, String password) async {
    try {
      await authenticationDataSourceImpl.signInWithCredentials(email, password);
      return Right(true);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.authentication));
    }
  }

  @override
  Future<Either<AppError, bool>> signOut() async {
    try {
      await authenticationDataSourceImpl.signOut();
      return Right(true);
    } on Exception {
      return Left(
        AppError(appErrorType: AppErrorType.authentication),
      );
    }
  }

  @override
  Future<Either<AppError, bool>> signUp(String email, String password) async {
    try {
      await authenticationDataSourceImpl.signUpWithCredentials(email, password);
      return Right(true);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.authentication));
    }
  }

  @override
  bool isSignedIn() {
    return authenticationDataSourceImpl.isSignedIn();
  }

  @override
  String getEmailId() {
    return authenticationDataSourceImpl.getEmailId();
  }

  @override
  Future<Either<AppError, void>> storeUserCredentials(
      Map<String, String> authData) async {
    try {
      await remoteDataSourceImpl.storeUserCredentials(authData);
      return Right(null);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.firebase));
    }
  }

  @override
  Future<Either<AppError, List<UserEntity>>> getCFUserList(
      List<String> params) async {
    try {
      List<UserEntity> userList = await remoteDataSourceImpl.getCFUser(params);
      return Right(userList);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, UserModel>> fetchUserDetail() async {
    final String uid = authenticationDataSourceImpl.getUid();
    print("uid:$uid");
    try {
      UserModel usermodel = await remoteDataSourceImpl.fetchUserDetails(uid);
      print("usermodel:$usermodel");
      return Right(usermodel);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> verifyEmail() async {
    try {
      authenticationDataSourceImpl.verifyEmail();
      return Right(null);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.authentication));
    }
  }

  @override
  Future<bool> isEmailVerified() async {
    return await authenticationDataSourceImpl.isEmailVerified();
  }

  @override
  Future<Either<AppError, void>> updateIsEmailVerified(String uid) async {
    try {
      await remoteDataSourceImpl.updateIsEmailVerified(uid);
      return Right(null);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.firebase));
    }
  }

  @override
  Future<Either<AppError, List<CuratedContestModel>>> fetchCuratedContest(
      String platformId, String contestId) async {
    try {
      List<CuratedContestModel> curatedContestModelList =
          await remoteDataSourceImpl.fetchCuratedContest(platformId, contestId);
      return Right(curatedContestModelList);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.firebase));
    }
  }

  @override
  Future<Either<AppError, void>> createCuratedContest(
      CuratedContestModel curatedContestModel) async {
    try {
      await remoteDataSourceImpl.createCuratedContest(curatedContestModel);
      return Right(null);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.firebase));
    }
  }
}
