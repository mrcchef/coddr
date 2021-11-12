import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/cf_standings_entity.dart';
import 'package:coddr/domain/entities/contest_entity.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/domain/entities/participated_contest.dart';
import 'package:coddr/domain/entities/user_entity.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class PlatformRepository {
  Future<Either<AppError, List<ContestEntity>>> getCFContestList();

  Future<Either<AppError, bool>> signIn(String email, String password);

  Future<Either<AppError, bool>> signUp(String email, String password);

  Future<Either<AppError, bool>> signOut();

  bool isSignedIn();

  String getEmailId();

  Future<Either<AppError, void>> storeUserCredentials(
      Map<String, String> authData);

  Future<Either<AppError, List<UserEntity>>> getCFUserList(List<String> params);

  Future<Either<AppError, UserModel>> fetchUserDetail();

  Future<Either<AppError, void>> verifyEmail();

  Future<bool> isEmailVerified();

  Future<Either<AppError, void>> updateIsEmailVerified(String uid);

  Future<Either<AppError, List<CuratedContestModel>>> fetchCuratedContestList(
      String platformId, String contestId);

  Future<Either<AppError, void>> createCuratedContest(
      CuratedContestModel curatedContestModel);
  Future<Either<AppError, CFStandingsEntity>> getCFStandings(
      List<String> handles, String contestId);
  Future<Either<AppError, void>> updateIsHandleVerified(
      String uid, String platformId);

  Future<Either<AppError, void>> updateCuratedContest(
      CuratedContestModel curatedContestModel);

  Future<Either<AppError, void>> updateUserModel(UserModel userModel);

  Future<Either<AppError, List<ParticipatedContestModel>>>
      fetchParticipatedContests(String uid);

  Future<Either<AppError, CuratedContestModel>> fetchCuratedContest(
      ParticipatedContestModel participatedContestModel);

  Future<Either<AppError, bool>> updateParticipatedContests(
      String uid, ParticipatedContestModel participatedContestModel);
}
