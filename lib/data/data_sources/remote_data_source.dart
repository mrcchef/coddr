import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coddr/data/core/api_client.dart';
import 'package:coddr/data/data_sources/authentication_data_source.dart';
import 'package:coddr/data/model/cf_contest_list_model.dart';
import 'package:coddr/data/model/cf_contest_model.dart';
import 'package:coddr/data/model/cf_user_list_model.dart';
import 'package:coddr/data/model/cf_user_model.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:flutter/cupertino.dart';

abstract class RemoteDataSource {
  Future<List<CFContestModel>> getCFContest();
  Future<void> storeUserCredentials(Map<String, String> authData);
  Future<List<CFUserModel>> getCFUser(List<String> handles);
  Future<UserModel> fetchUserDetails(String uid);
  Future<void> storeUserDetails(UserModel userModel);
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
  Future<void> storeUserCredentials(Map<String, String> authData) async {
    final String uid = authenticationDataSourceImpl.getUid();
    await FirebaseFirestore.instance.collection('users').doc(uid).set(
      {
        'displayName': authData['displayName'],
        'email': authData['email'],
        'uid': uid,
      },
    );
  }

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
        'institution': userModel.instition,
      },
    );
  }

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
  Future<List<CFUserModel>> getCFUser(List<String> handles) async {
    final responseBody =
        await apiClient.get('user.info?', params: {'handles': handles});
    List<CFUserModel> userList = CFUserListModel.fromJson(responseBody).user;
    print(userList);
    return userList;
  }
}
