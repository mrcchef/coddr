import 'package:coddr/data/repositories/platform_repository_impl.dart';
import 'package:coddr/domain/entities/cf_contest_entity.dart';
import 'package:coddr/domain/entities/no_params.dart';
import 'package:coddr/domain/repositories/platform_repository.dart';
import 'package:coddr/domain/usecases/usecase.dart';
import 'package:flutter/material.dart';

class GetCFContestList extends Usecase<List<CFContestEntity>, NoParams> {
  final PlatformRepositoryImpl platformRepository;

  GetCFContestList({this.platformRepository});

  @override
  Future<List<CFContestEntity>> call(params) async {
    return await platformRepository.getCFContestList();
  }
}
