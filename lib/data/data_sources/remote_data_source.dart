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
import 'package:coddr/domain/entities/user_model.dart';
import 'package:flutter/cupertino.dart';

abstract class RemoteDataSource {
  Future<List<CFContestModel>> getCFContest();
  Future<void> storeUserCredentials(Map<String, String> authData);
  Future<List<CFUserModel>> getCFUser(List<String> handles);
  Future<UserModel> fetchUserDetails(String uid);
  Future<void> storeUserDetails(UserModel userModel);
  Future<void> updateIsEmailVerified(String uid);
  Future<List<CuratedContestModel>> fetchCuratedContest(
      String platformId, String contestId);
  Future<void> createCuratedContest(CuratedContestModel curatedContestModel);
  Future<CFStandingsModel> getCFStandings(
      List<String> handles, String contestId);
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
    print("getCFUser response body:" + responseBody);
    List<CFUserModel> userList = CFUserListModel.fromJson(responseBody).user;
    print(userList);
    return userList;
  }

  @override
  Future<void> storeUserCredentials(Map<String, String> authData) async {
    final String uid = authenticationDataSourceImpl.getUid();
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
      },
    );
  }

  @override
  Future<void> storeUserDetails(UserModel userModel) async {
    await FirebaseFirestore.instance.collection('users').doc(userModel.uid).set(
      {
        'displayName': userModel.displayName,
        'contactNumber': userModel.contactNumber,
        'coins': userModel.coins,
        'contest': userModel.contest,
        'wins': userModel.wins,
        'handleCF': userModel.handelCF,
        'handleCC': userModel.handelCC,
        'handelATC': userModel.handelATC,
        'handelHE': userModel.handelHE,
        'city': userModel.city,
        'state': userModel.state,
        'country': userModel.country,
        'occupation': userModel.occupation,
        'institution': userModel.institution,
      },
    );
  }

  @override
  Future<void> updateIsEmailVerified(String uid) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).update(
      {'isEmailVerified': true},
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
      print("value data: ${value.data()}");
    });
    print(userModel);
    return userModel;
  }

  @override
  Future<List<CuratedContestModel>> fetchCuratedContest(
      String platformId, String contestId) async {
    List<CuratedContestModel> curatedContestModelList = [];
    print(contestId);
    print(platformId);
    await FirebaseFirestore.instance
        .collection('contests')
        .doc(platformId)
        .collection(contestId)
        .get()
        .then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        print(value.docs[i].data());
        CuratedContestModel model =
            CuratedContestModel.fromMap(value.docs[i].data());
        curatedContestModelList.add(model);
      }
    });

    print("curated contest $curatedContestModelList");
    return curatedContestModelList;
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
    // .add(curatedContestModel.toMap());
  }

  Future<CFStandingsModel> getCFStandings(
      List<String> handles, String contestId) async {
    final responseBody =
        await apiClient.get('contest.standings?contestId=$contestId&', params: {
      'handles': handles,
    });
    print(responseBody);
    CFStandingsModel standings =
        CFStandingsListModel.fromJson(responseBody).result;
    print(standings);

    return standings;
  }
}
