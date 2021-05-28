import 'cf_contest_model.dart';

class CFContestListModel {
  String status;
  List<CFContestModel> contest;

  CFContestListModel({this.status, this.contest});

  CFContestListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['result'] != null) {
      contest = [];
      json['result'].forEach((v) {
        contest.add(new CFContestModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.contest != null) {
      data['result'] = this.contest.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
