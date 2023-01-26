import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/presentation/journeys/curated_contest_home/CuratedContestHomePage.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ParticipatedCuratedContestCard extends StatefulWidget {
  final CuratedContestModel curatedContestModel;

  const ParticipatedCuratedContestCard({
    Key key,
    @required this.curatedContestModel,
  }) : super(key: key);
  @override
  _ParticipatedCuratedContestCardState createState() =>
      _ParticipatedCuratedContestCardState();
}

class _ParticipatedCuratedContestCardState
    extends State<ParticipatedCuratedContestCard> {
  double getPercentage() {
    double val = widget.curatedContestModel.filledSpots /
        widget.curatedContestModel.totalSpots;
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CuratedContestHomePage(
              curatedContestModel: widget.curatedContestModel,
            ),
          ),
        );
      },
      child: Card(
        shape: CircleBorder(),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.dimen_20.w),
              color: Color(0xFFEED1D1)),
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
                          'Contest Name',
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(widget.curatedContestModel.contestName),
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
