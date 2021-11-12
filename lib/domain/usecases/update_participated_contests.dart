import 'package:coddr/domain/entities/app_error.dart';
import 'package:coddr/domain/entities/participated_contest_argument.dart';
import 'package:coddr/domain/repositories/platform_repository.dart';
import 'package:coddr/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class UpdateParticipatedContests
    extends Usecase<bool, ParticipatedContestArgument> {
  final PlatformRepository platformRepository;

  UpdateParticipatedContests({this.platformRepository});

  @override
  Future<Either<AppError, bool>> call(participatedContestArgument) async {
    return platformRepository.updateParticipatedContests(
        participatedContestArgument.uid,
        participatedContestArgument.participatedContestModel);
  }
}
