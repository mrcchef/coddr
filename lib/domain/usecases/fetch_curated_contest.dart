import 'package:coddr/data/repositories/platform_repository_impl.dart';
import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/domain/entities/fetch_curated_contest_argument.dart';
import 'package:coddr/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class FetchCuratedContest
    extends Usecase<List<CuratedContestModel>, FetchCuratedContestArgument> {
  final PlatformRepositoryImpl platformRepository;

  FetchCuratedContest({this.platformRepository});

  @override
  Future<Either<AppError, List<CuratedContestModel>>> call(
      fetchCuratedContestArgument) async {
    return await platformRepository.fetchCuratedContest(
        fetchCuratedContestArgument.platfromId,
        fetchCuratedContestArgument.contestId.toString());
  }
}
