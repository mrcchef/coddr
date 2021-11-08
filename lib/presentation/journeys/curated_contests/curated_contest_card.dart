import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/presentation/journeys/RankList/RankListPage.dart';
import 'package:coddr/presentation/journeys/curated_contests/confirm_participation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CuratedContestCard extends StatefulWidget {
  final CuratedContestModel curatedContestModel;
  final DateTime startTime;
  final DateTime endTime;
  final String title;
  final bool isPrivate;
  final UserModel userModel;

  const CuratedContestCard({
    Key key,
    @required this.curatedContestModel,
    @required this.startTime,
    @required this.endTime,
    @required this.title,
    @required this.isPrivate,
    @required this.userModel,
  }) : super(key: key);
  @override
  _CuratedContestCardState createState() => _CuratedContestCardState();
}

class _CuratedContestCardState extends State<CuratedContestCard> {
  double getPercentage() {
    double val = widget.curatedContestModel.filledSpots /
        widget.curatedContestModel.totalSpots;
    return val;
  }

  bool isParticipant() {
    bool check = false;
    print(widget.userModel.email);
    widget.curatedContestModel.participants.forEach((element) {
      if (element['email'] == widget.userModel.email) check = true;
      print(element['email']);
    });
    return check;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.userModel == null
          ? null
          : () {
              if (isParticipant())
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RankListPage(
                      curatedContestModel: widget.curatedContestModel,
                      startTime: widget.startTime,
                      endTime: widget.endTime,
                      title: widget.title,
                    ),
                  ),
                );
              else if (!widget.userModel.isHandelCFVerified)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Codeforces Handle is not verfied!!"),
                    backgroundColor: Colors.red,
                  ),
                );
              else if (widget.userModel.coins <
                  widget.curatedContestModel.entryFees) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Insufficient coins!!"),
                    backgroundColor: Colors.red,
                  ),
                );
              } else if (!widget.isPrivate) {
                // need a page for confirmation
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ConfirmParticipation(
                        userModel: widget.userModel,
                        curatedContestModel: widget.curatedContestModel,
                        startTime: widget.startTime,
                        endTime: widget.endTime,
                        title: widget.title)));
              } else {
                // it's a private page
                // need a page to enter password
              }
            },
      child: Card(
        shape: CircleBorder(),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.dimen_20.w),
              color: HexColor('EED1D1')),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(Sizes.dimen_8.w),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text('Total Prize'),
                        Text('₹ ${widget.curatedContestModel.prize}'),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          'Contest Id',
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(widget.curatedContestModel.contestId),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text('Entry fees'),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Sizes.dimen_8.w),
                              color: Colors.green,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(Sizes.dimen_4.w),
                              child: Text(
                                '₹ ${widget.curatedContestModel.entryFees}',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              new LinearPercentIndicator(
                animation: true,
                lineHeight: Sizes.dimen_8.w,
                animationDuration: 2000,
                percent: getPercentage(),
                // center: Text("40"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.red[600],
                backgroundColor: Colors.grey[300],
              ),
              Padding(
                padding: EdgeInsets.all(Sizes.dimen_8.w),
                child: Row(
                  children: [
                    Text(
                        '${widget.curatedContestModel.totalSpots - widget.curatedContestModel.filledSpots} spots left'),
                    Spacer(),
                    Text('${widget.curatedContestModel.totalSpots} spots'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
