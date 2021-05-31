import 'package:coddr/data/core/api_client.dart';
import 'package:coddr/data/model/cf_contest_list_model.dart';
import 'package:coddr/data/model/cf_contest_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

abstract class RemoteDataSource {
  Future<List<CFContestModel>> getCFContest();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final APIClient apiClient;

  RemoteDataSourceImpl({@required this.apiClient});

  Future<List<CFContestModel>> getCFContest() async {
    final responseBody = await apiClient.get('contest.list');
    List<CFContestModel> contestList =
        CFContestListModel.fromJson(responseBody).contest;
    
    return contestList;
  }
}
