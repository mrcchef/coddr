import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/participated_contest.dart';
import 'package:coddr/domain/repositories/platform_repository.dart';
import 'package:coddr/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class FetchParticipatedContests
    extends Usecase<List<ParticipatedContestModel>, String> {
  final PlatformRepository platformRepository;

  FetchParticipatedContests({this.platformRepository});

  @override
  Future<Either<AppError, List<ParticipatedContestModel>>> call(uid) async {
    return await platformRepository.fetchParticipatedContests(uid);
  }
}
