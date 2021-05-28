import 'package:coddr/data/repositories/platform_repository_impl.dart';
import 'package:coddr/domain/entities/contest_entity.dart';
import 'package:coddr/domain/entities/no_params.dart';

import 'package:coddr/domain/usecases/usecase.dart';

class GetCFContestList extends Usecase<List<ContestEntity>, NoParams> {
  final PlatformRepositoryImpl platformRepository;

  GetCFContestList({this.platformRepository});

  @override
  Future<List<ContestEntity>> call(params) async {
    return await platformRepository.getCFContestList();
  }
}
