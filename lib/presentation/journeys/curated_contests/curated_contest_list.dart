import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/presentation/journeys/curated_contests/curated_contest_card.dart';
import 'package:flutter/material.dart';

class CuratedContestList extends StatefulWidget {
  final List<CuratedContestModel> curatedContest;
  final DateTime startTime;
  final DateTime endtime;
  final String title;

  const CuratedContestList({
    Key key,
    @required this.curatedContest,
    @required this.startTime,
    @required this.endtime,
    @required this.title,
  }) : super(key: key);

  @override
  _CuratedContestListState createState() => _CuratedContestListState();
}

class _CuratedContestListState extends State<CuratedContestList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.curatedContest.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.all(Sizes.dimen_8.w),
            child: CuratedContestCard(
              curatedContestModel: widget.curatedContest[index],
              startTime: widget.startTime,
              endtime: widget.endtime,
              title: widget.title,
            ),
          );
        });
  }
}
