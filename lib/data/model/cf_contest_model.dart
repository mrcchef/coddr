import 'package:coddr/domain/entities/contest_entity.dart';

class CFContestModel extends ContestEntity {
  final int id;
  final String name;
  final String type;
  final String phase;
  final bool frozen;
  final int durationSeconds;
  final int startTimeSeconds;
  final int relativeTimeSeconds;

  CFContestModel(
      {this.id,
      this.name,
      this.type,
      this.phase,
      this.frozen,
      this.durationSeconds,
      this.startTimeSeconds,
      this.relativeTimeSeconds})
      : super(
          id: id,
          durationSeconds: durationSeconds,
          frozen: frozen,
          name: name,
          phase: phase,
          relativeTimeSeconds: relativeTimeSeconds,
          startTimeSeconds: startTimeSeconds,
          type: type,
          platformHandle: "CF",
        );

  factory CFContestModel.fromJson(Map<String, dynamic> json) {
    return CFContestModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      phase: json['phase'],
      frozen: json['frozen'],
      durationSeconds: json['durationSeconds'],
      startTimeSeconds: json['startTimeSeconds'],
      relativeTimeSeconds: json['relativeTimeSeconds'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['phase'] = this.phase;
    data['frozen'] = this.frozen;
    data['durationSeconds'] = this.durationSeconds;
    data['startTimeSeconds'] = this.startTimeSeconds;
    data['relativeTimeSeconds'] = this.relativeTimeSeconds;
    return data;
  }
}
