import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/domain/entities/fetch_curated_contest_argument.dart';
import 'package:coddr/domain/repositories/platform_repository.dart';
import 'package:coddr/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class FetchCuratedContestList
    extends Usecase<List<CuratedContestModel>, FetchCuratedContestArgument> {
  final PlatformRepository platformRepository;

  FetchCuratedContestList({this.platformRepository});

  @override
  Future<Either<AppError, List<CuratedContestModel>>> call(
      fetchCuratedContestArgument) async {
    return await platformRepository.fetchCuratedContestList(
        fetchCuratedContestArgument.platfromId,
        fetchCuratedContestArgument.contestId.toString());
  }
}
