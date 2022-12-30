import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coddr/data/core/api_client.dart';
import 'package:coddr/data/data_sources/authentication_data_source.dart';
import 'package:coddr/data/model/cf_contest_list_model.dart';
import 'package:coddr/data/model/cf_contest_model.dart';
import 'package:coddr/data/model/cf_standings_list_model.dart';
import 'package:coddr/data/model/cf_standings_model.dart';
import 'package:coddr/data/model/cf_user_list_model.dart';
import 'package:coddr/data/model/cf_user_model.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/domain/entities/participated_contest.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:flutter/cupertino.dart';

abstract class RemoteDataSource {
  Future<List<CFContestModel>> getCFContest();
  Future<void> storeUserCredentials(Map<String, String> authData);
  Future<List<CFUserModel>> getCFUser(List<String> handles);
  Future<UserModel> fetchUserDetails(String uid);
  Future<void> storeUserDetails(UserModel userModel);
  Future<void> updateIsEmailVerified(String uid);
  Future<List<CuratedContestModel>> fetchCuratedContestList(
      String platformId, String contestId);
  Future<void> createCuratedContest(CuratedContestModel curatedContestModel);
  Future<CFStandingsModel> getCFStandings(
      List<String> handles, String contestId);
  Future<void> updateIsHandleVerified(String uid, String platformId);
  Future<void> updateCuratedContest(CuratedContestModel curatedContestModel);
  Future<void> updateUserModel(UserModel userModel);
  Future<List<ParticipatedContestModel>> fetchParticipatedContests(String uid);
  Future<CuratedContestModel> fetchCuratedContest(
      ParticipatedContestModel participatedContest);
  Future<void> updateParticipatedContests(
      String uid, ParticipatedContestModel participatedContest);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final APIClient apiClient;
  final FirebaseFirestore firebaseFirestore;
  final AuthenticationDataSource authenticationDataSource;

  RemoteDataSourceImpl({
    @required this.apiClient,
    @required this.firebaseFirestore,
    @required this.authenticationDataSource,
  });

  @override
  Future<List<CFContestModel>> getCFContest() async {
    final responseBody = await apiClient.get('contest.list');
    List<CFContestModel> contestList =
        CFContestListModel.fromJson(responseBody).contest;

    return contestList;
  }

  @override
  Future<List<CFUserModel>> getCFUser(List<String> handles) async {
    final responseBody =
        await apiClient.get('user.info?', params: {'handles': handles});

    List<CFUserModel> userList = CFUserListModel.fromJson(responseBody).user;

    return userList;
  }

  Future<CFStandingsModel> getCFStandings(
      List<String> handles, String contestId) async {
    final responseBody =
        await apiClient.get('contest.standings?contestId=$contestId&', params: {
      'handles': handles,
    });

    CFStandingsModel standings =
        CFStandingsListModel.fromJson(responseBody).result;
    return standings;
  }

  @override
  Future<void> storeUserCredentials(Map<String, String> authData) async {
    const int defaultCoins = 100;
    final String uid = authenticationDataSource.getUid();
    await FirebaseFirestore.instance.collection('users').doc(uid).set(
      {
        'displayName': authData['displayName'],
        'email': authData['email'],
        'uid': uid,
        'imageUrl': "",
        'isEmailVerified': false,
        'isHandelATCVerified': false,
        'isHandelCCVerified': false,
        'isHandelCFVerified': false,
        'isHandelHEVerified': false,
        'coins': defaultCoins, // default coins
        'contest': 0,
        'wins': 0,
        'isAdmin': false,
      },
    );
  }

  @override
  Future<void> storeUserDetails(UserModel userModel) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uid)
        .set(userModel.toMap());
  }

  @override
  Future<void> updateIsEmailVerified(String uid) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).update(
      {'isEmailVerified': true},
    );
  }

  @override
  Future<void> updateIsHandleVerified(String uid, String platformId) async {
    String value;
    if (platformId == 'CF')
      value = 'isHandelCFVerified';
    else if (platformId == 'CC') value = 'isHandelCCVerified';

    await FirebaseFirestore.instance.collection('users').doc(uid).update(
      {value: true},
    );
  }

  @override
  Future<UserModel> fetchUserDetails(String uid) async {
    UserModel userModel;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) {
      userModel = UserModel.fromMap(value.data());
    });

    return userModel;
  }

  @override
  Future<List<ParticipatedContestModel>> fetchParticipatedContests(
      String uid) async {
    List<ParticipatedContestModel> participatedContestList = [];
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('participatedContests')
        .get()
        .then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        ParticipatedContestModel model =
            ParticipatedContestModel.fromMap(value.docs[i].data());
        participatedContestList.add(model);
      }
    });

    return participatedContestList;
  }

  @override
  Future<void> updateParticipatedContests(
      String uid, ParticipatedContestModel participatedContestModel) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('participatedContests')
        .doc(participatedContestModel.contestId)
        .set(participatedContestModel.toMap());
  }

  @override
  Future<List<CuratedContestModel>> fetchCuratedContestList(
      String platformId, String contestId) async {
    List<CuratedContestModel> curatedContestModelList = [];
    await FirebaseFirestore.instance
        .collection('contests')
        .doc(platformId)
        .collection(contestId)
        .get()
        .then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        CuratedContestModel model =
            CuratedContestModel.fromMap(value.docs[i].data());
        curatedContestModelList.add(model);
      }
    });

    return curatedContestModelList;
  }

  @override
  Future<CuratedContestModel> fetchCuratedContest(
      ParticipatedContestModel participatedContestModel) async {
    CuratedContestModel curatedContestModel;
    await FirebaseFirestore.instance
        .collection('contests')
        .doc(participatedContestModel.platformId)
        .collection(participatedContestModel.parentContestId)
        .doc(participatedContestModel.contestId)
        .get()
        .then((value) {
      curatedContestModel = CuratedContestModel.fromMap(value.data());
    });

    return curatedContestModel;
  }

  @override
  Future<void> createCuratedContest(
      CuratedContestModel curatedContestModel) async {
    await FirebaseFirestore.instance
        .collection('contests')
        .doc(curatedContestModel.platformId)
        .collection(curatedContestModel.parentContestId)
        .doc(curatedContestModel.contestId)
        .set(curatedContestModel.toMap());
  }

  @override
  Future<void> updateCuratedContest(
      CuratedContestModel curatedContestModel) async {
    await FirebaseFirestore.instance
        .collection('contests')
        .doc(curatedContestModel.platformId)
        .collection(curatedContestModel.parentContestId)
        .doc(curatedContestModel.contestId)
        .update(curatedContestModel.toMap());
  }

  @override
  Future<void> updateUserModel(UserModel userModel) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uid)
        .update(userModel.toMap());
  }
}
