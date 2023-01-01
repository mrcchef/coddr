import 'package:coddr/data/data_sources/authentication_data_source.dart';
import 'package:coddr/data/data_sources/remote_data_source.dart';
import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/cf_standings_entity.dart';
import 'package:coddr/domain/entities/contest_entity.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/domain/entities/participated_contest.dart';
import 'package:coddr/domain/entities/user_entity.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/domain/repositories/platform_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class PlatformRepositoryImpl extends PlatformRepository {
  RemoteDataSource remoteDataSource;
  AuthenticationDataSource authenticationDataSource;

  PlatformRepositoryImpl(
      {@required this.remoteDataSource,
      @required this.authenticationDataSource});

  @override
  Future<Either<AppError, void>> storeUserModel(UserModel userModel) async {
    try {
      await remoteDataSource.storeUserModel(userModel);
      return Right(null);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.firebase));
    }
  }

  @override
  String getUid() {
    return authenticationDataSource.getUid();
  }

  @override
  Future<Either<AppError, List<ContestEntity>>> getCFContestList() async {
    try {
      List<ContestEntity> contestList = await remoteDataSource.getCFContest();
      return Right(contestList);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, CFStandingsEntity>> getCFStandings(
      List<String> handles, String contestId) async {
    try {
      CFStandingsEntity standings =
          await remoteDataSource.getCFStandings(handles, contestId);
      return Right(standings);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, bool>> signIn(String email, String password) async {
    try {
      await authenticationDataSource.signInWithCredentials(email, password);
      return Right(true);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.authentication));
    }
  }

  @override
  Future<Either<AppError, bool>> signOut() async {
    try {
      await authenticationDataSource.signOut();
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
      await authenticationDataSource.signUpWithCredentials(email, password);
      return Right(true);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.authentication));
    }
  }

  @override
  bool isSignedIn() {
    return authenticationDataSource.isSignedIn();
  }

  @override
  String getEmailId() {
    return authenticationDataSource.getEmailId();
  }

  @override
  Future<Either<AppError, void>> storeUserCredentials(
      Map<String, String> authData) async {
    try {
      await remoteDataSource.storeUserCredentials(authData);
      return Right(null);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.firebase));
    }
  }

  @override
  Future<Either<AppError, List<UserEntity>>> getCFUserList(
      List<String> params) async {
    try {
      List<UserEntity> userList = await remoteDataSource.getCFUser(params);
      return Right(userList);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, UserModel>> fetchUserDetail() async {
    final String uid = authenticationDataSource.getUid();

    try {
      UserModel usermodel = await remoteDataSource.fetchUserDetails(uid);

      return Right(usermodel);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> verifyEmail() async {
    try {
      authenticationDataSource.verifyEmail();
      return Right(null);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.authentication));
    }
  }

  @override
  Future<bool> isEmailVerified() async {
    return await authenticationDataSource.isEmailVerified();
  }

  @override
  Future<Either<AppError, void>> updateIsEmailVerified(String uid) async {
    try {
      await remoteDataSource.updateIsEmailVerified(uid);
      return Right(null);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.firebase));
    }
  }

  @override
  Future<Either<AppError, void>> updateIsHandleVerified(
      String uid, String platformId) async {
    try {
      await remoteDataSource.updateIsHandleVerified(uid, platformId);
      return Right(null);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.firebase));
    }
  }

  @override
  Future<Either<AppError, List<CuratedContestModel>>> fetchCuratedContestList(
      String platformId, String contestId) async {
    try {
      List<CuratedContestModel> curatedContestModelList =
          await remoteDataSource.fetchCuratedContestList(platformId, contestId);
      return Right(curatedContestModelList);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.firebase));
    }
  }

  @override
  Future<Either<AppError, void>> createCuratedContest(
      CuratedContestModel curatedContestModel) async {
    try {
      await remoteDataSource.createCuratedContest(curatedContestModel);
      return Right(null);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.firebase));
    }
  }

  @override
  Future<Either<AppError, void>> updateCuratedContest(
      CuratedContestModel curatedContestModel) async {
    try {
      await remoteDataSource.updateCuratedContest(curatedContestModel);
      return Right(null);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.firebase));
    }
  }

  @override
  Future<Either<AppError, void>> updateUserModel(UserModel userModel) async {
    try {
      await remoteDataSource.updateUserModel(userModel);
      return Right(null);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.firebase));
    }
  }

  @override
  Future<Either<AppError, List<ParticipatedContestModel>>>
      fetchParticipatedContests(String uid) async {
    try {
      List<ParticipatedContestModel> participatedContestsList =
          await remoteDataSource.fetchParticipatedContests(uid);
      return Right(participatedContestsList);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.firebase));
    }
  }

  @override
  Future<Either<AppError, CuratedContestModel>> fetchCuratedContest(
      ParticipatedContestModel participatedContestModel) async {
    try {
      CuratedContestModel curatedContestModel =
          await remoteDataSource.fetchCuratedContest(participatedContestModel);
      return Right(curatedContestModel);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.firebase));
    }
  }

  @override
  Future<Either<AppError, bool>> updateParticipatedContests(
      String uid, ParticipatedContestModel participatedContest) async {
    try {
      await remoteDataSource.updateParticipatedContests(
          uid, participatedContest);
      return Right(true);
    } on Exception {
      return Left(AppError(appErrorType: AppErrorType.firebase));
    }
  }
}
