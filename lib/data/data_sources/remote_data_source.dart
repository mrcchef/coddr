import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coddr/data/core/api_client.dart';
import 'package:coddr/data/data_sources/authentication_data_source.dart';
import 'package:coddr/data/model/cf_contest_list_model.dart';
import 'package:coddr/data/model/cf_contest_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

abstract class RemoteDataSource {
  Future<List<CFContestModel>> getCFContest();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final APIClient apiClient;
  final FirebaseFirestore firebaseFirestore;
  final AuthenticationDataSourceImpl authenticationDataSourceImpl;

  RemoteDataSourceImpl({
    @required this.apiClient,
    @required this.firebaseFirestore,
    @required this.authenticationDataSourceImpl,
  });

  Future<List<CFContestModel>> getCFContest() async {
    final responseBody = await apiClient.get('contest.list');
    List<CFContestModel> contestList =
        CFContestListModel.fromJson(responseBody).contest;

    return contestList;
  }

  Future<void> storeUserCredentials(Map<String, String> authData) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(authenticationDataSourceImpl.getUid())
        .set({
      'username': authData['username'],
      'email': authData['email'],
    });
  }
}
