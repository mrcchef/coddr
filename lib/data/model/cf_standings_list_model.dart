import 'package:coddr/data/model/cf_standings_model.dart';

class CFStandingsListModel {
  String status;
  CFStandingsModel result;

  CFStandingsListModel({this.status, this.result});

  CFStandingsListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result'] != null
        ? new CFStandingsModel.fromJson(json['result'])
        : null;

    //CFStandingsModel temp = CFStandingsModel.fromJson(json['result']);
    //print("Temp =");
    //print(temp);
    print("RESULT CFSTANDINGSLISTMODEL");
    print(result);
    print("jsonResult = ");
    print(json['result']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}
