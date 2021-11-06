import 'package:coddr/domain/entities/cf_handel_standings_entity.dart';
import 'package:coddr/domain/entities/cf_standings_entity.dart';

class CFStandingsModel extends CFStandingsEntity {
  final Contest contest;
  final List<Problems> problems;
  final List<Rows> rows;

  CFStandingsModel({this.contest, this.problems, this.rows})
      : super(
            contestId: contest.id,
            contestName: contest.name,
            phase: contest.phase,
            durationSeconds: contest.durationSeconds,
            startTimeSeconds: contest.startTimeSeconds,
            relativeTimeSeconds: contest.relativeTimeSeconds,
            cfHandelStandingsEntity:
                rows.map<CFHandelStandingsEntity>((element) {
              return CFHandelStandingsEntity(
                  handle: element.party.members[0].handle,
                  rank: element.rank,
                  points: element.points,
                  penalty: element.penalty);
            }).toList());

  List<CFHandelStandingsEntity> getRankListRows(List<Rows> rows) {
    List<CFHandelStandingsEntity> result = [];
    rows.forEach((element) {
      result.add(CFHandelStandingsEntity(
          handle: element.party.members[0].handle,
          rank: element.rank,
          points: element.points,
          penalty: element.penalty));
    });
    return result;
  }

  factory CFStandingsModel.fromJson(Map<String, dynamic> json) {
    Contest _contest =
        json['contest'] != null ? new Contest.fromJson(json['contest']) : null;
    List<Problems> _problems = [];
    List<Rows> _rows = [];

    if (json['problems'] != null) {
      json['problems'].forEach((v) {
        _problems.add(new Problems.fromJson(v));
      });
    }
    if (json['rows'] != null) {
      json['rows'].forEach((v) {
        _rows.add(new Rows.fromJson(v));
      });
    }
    return CFStandingsModel(
      contest: _contest,
      problems: _problems,
      rows: _rows,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.contest != null) {
      data['contest'] = this.contest.toJson();
    }
    if (this.problems != null) {
      data['problems'] = this.problems.map((v) => v.toJson()).toList();
    }
    if (this.rows != null) {
      data['rows'] = this.rows.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Contest {
  int id;
  String name;
  String type;
  String phase;
  bool frozen;
  int durationSeconds;
  int startTimeSeconds;
  int relativeTimeSeconds;

  Contest(
      {this.id,
      this.name,
      this.type,
      this.phase,
      this.frozen,
      this.durationSeconds,
      this.startTimeSeconds,
      this.relativeTimeSeconds});

  factory Contest.fromJson(Map<String, dynamic> json) {
    return Contest(
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

class Problems {
  int contestId;
  String index;
  String name;
  String type;
  List<String> tags;

  Problems({this.contestId, this.index, this.name, this.type, this.tags});

  factory Problems.fromJson(Map<String, dynamic> json) {
    return Problems(
      contestId: json['contestId'],
      index: json['index'],
      name: json['name'],
      type: json['type'],
      tags: json['tags'].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contestId'] = this.contestId;
    data['index'] = this.index;
    data['name'] = this.name;
    data['type'] = this.type;
    data['tags'] = this.tags;
    return data;
  }
}

class Rows {
  Party party;
  int rank;
  int points;
  int penalty;
  int successfulHackCount;
  int unsuccessfulHackCount;
  List<ProblemResults> problemResults;

  Rows(
      {this.party,
      this.rank,
      this.points,
      this.penalty,
      this.successfulHackCount,
      this.unsuccessfulHackCount,
      this.problemResults});

  factory Rows.fromJson(Map<String, dynamic> json) {
    List<ProblemResults> problemResults = [];
    if (json['problemResults'] != null) {
      json['problemResults'].forEach((v) {
        problemResults.add(new ProblemResults.fromJson(v));
      });
    }
    return Rows(
      party: json['party'] != null ? new Party.fromJson(json['party']) : null,
      rank: json['rank'],
      points: json['points'].toInt(),
      penalty: json['penalty'],
      successfulHackCount: json['successfulHackCount'],
      unsuccessfulHackCount: json['unsuccessfulHackCount'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.party != null) {
      data['party'] = this.party.toJson();
    }
    data['rank'] = this.rank;
    data['points'] = this.points;
    data['penalty'] = this.penalty;
    data['successfulHackCount'] = this.successfulHackCount;
    data['unsuccessfulHackCount'] = this.unsuccessfulHackCount;
    if (this.problemResults != null) {
      data['problemResults'] =
          this.problemResults.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Party {
  int contestId;
  List<Members> members;
  String participantType;
  bool ghost;
  int startTimeSeconds;

  Party(
      {this.contestId,
      this.members,
      this.participantType,
      this.ghost,
      this.startTimeSeconds});

  factory Party.fromJson(Map<String, dynamic> json) {
    List<Members> _members = [];
    if (json['members'] != null) {
      json['members'].forEach((v) {
        _members.add(new Members.fromJson(v));
      });
    }
    return Party(
      contestId: json['contestId'],
      participantType: json['participantType'],
      members: _members,
      ghost: json['ghost'],
      startTimeSeconds: json['startTimeSeconds'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contestId'] = this.contestId;
    if (this.members != null) {
      data['members'] = this.members.map((v) => v.toJson()).toList();
    }
    data['participantType'] = this.participantType;
    data['ghost'] = this.ghost;
    data['startTimeSeconds'] = this.startTimeSeconds;
    return data;
  }
}

class Members {
  String handle;

  Members({this.handle});

  factory Members.fromJson(Map<String, dynamic> json) {
    return Members(
      handle: json['handle'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['handle'] = this.handle;
    return data;
  }
}

class ProblemResults {
  int points;
  int rejectedAttemptCount;
  String type;
  int bestSubmissionTimeSeconds;

  ProblemResults(
      {this.points,
      this.rejectedAttemptCount,
      this.type,
      this.bestSubmissionTimeSeconds});

  factory ProblemResults.fromJson(Map<String, dynamic> json) {
    return ProblemResults(
      points: json['points'].toInt(),
      rejectedAttemptCount: json['rejectedAttemptCount'],
      type: json['type'],
      bestSubmissionTimeSeconds: json['bestSubmissionTimeSeconds'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['points'] = this.points;
    data['rejectedAttemptCount'] = this.rejectedAttemptCount;
    data['type'] = this.type;
    data['bestSubmissionTimeSeconds'] = this.bestSubmissionTimeSeconds;
    return data;
  }
}
