import 'package:coddr/data/data_sources/remote_data_source.dart';
import 'package:coddr/domain/entities/cf_contest_entity.dart';
import 'package:coddr/domain/repositories/platform_repository.dart';
import 'package:flutter/material.dart';

class PlatformRepositoryImpl extends PlatformRepository {
  RemoteDataSourceImpl remoteDataSourceImpl;

  PlatformRepositoryImpl({@required this.remoteDataSourceImpl});

  @override
  Future<List<CFContestEntity>> getCFContestList() async {
    try {
      List<CFContestEntity> contestList =
          await remoteDataSourceImpl.getCFContest();
      return contestList;
    } on Exception {
      return null;
    }
  }
}
