import 'package:coddr/domain/entities/cf_contest_entity.dart';

abstract class PlatformRepository {
  Future<List<CFContestEntity>> getCFContestList();
}
