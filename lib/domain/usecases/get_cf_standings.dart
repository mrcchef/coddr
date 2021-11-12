import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/cf_standings_entity.dart';
import 'package:coddr/domain/entities/get_cf_standings_arguments.dart';
import 'package:coddr/domain/repositories/platform_repository.dart';
import 'package:coddr/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetCFStandings
    extends Usecase<CFStandingsEntity, GetCFStandingsArguments> {
  final PlatformRepository platformRepository;

  GetCFStandings({this.platformRepository});

  @override
  Future<Either<AppError, CFStandingsEntity>> call(
      getCFStandingsArguments) async {
    return await platformRepository.getCFStandings(
        getCFStandingsArguments.handles, getCFStandingsArguments.contestId);
  }
}
