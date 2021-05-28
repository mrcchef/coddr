import 'package:coddr/domain/entities/contest_entity.dart';

abstract class PlatformRepository {
  Future<List<ContestEntity>> getCFContestList();
}
