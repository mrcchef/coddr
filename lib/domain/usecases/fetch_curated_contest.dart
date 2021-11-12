import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/domain/entities/participated_contest.dart';
import 'package:coddr/domain/repositories/platform_repository.dart';
import 'package:coddr/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class FetchCuratedContest
    extends Usecase<CuratedContestModel, ParticipatedContestModel> {
  final PlatformRepository platformRepository;

  FetchCuratedContest({this.platformRepository});

  @override
  Future<Either<AppError, CuratedContestModel>> call(
      participatedContest) async {
    return await platformRepository.fetchCuratedContest(participatedContest);
  }
}
