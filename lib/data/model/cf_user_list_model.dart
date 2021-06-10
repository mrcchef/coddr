import 'cf_user_model.dart';

class CFUserListModel {
  String status;
  List<CFUserModel> user;

  CFUserListModel({this.status, this.user});

  CFUserListModel.fromJson(Map<String, dynamic> json) {
    user = [];
    status = json['status'];
    if (json['result'] != null) {
      json['result'].forEach((v) {
        user.add(new CFUserModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.user != null) {
      data['result'] = this.user.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

