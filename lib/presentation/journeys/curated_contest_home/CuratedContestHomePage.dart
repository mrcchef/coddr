import 'dart:async';

import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/enums/enum_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/presentation/journeys/curated_contest_home/CuratedContestCardInfo.dart';
import 'package:coddr/presentation/journeys/curated_contest_home/LeaderBoardPage.dart';
import 'package:coddr/presentation/journeys/curated_contest_home/ParticipantsPage.dart';
import 'package:coddr/presentation/journeys/curated_contest_home/PrizePoolPage.dart';
import 'package:coddr/presentation/journeys/curated_contest_home/ResultPage.dart';
import 'package:coddr/presentation/themes/app_color.dart';
import 'package:coddr/presentation/themes/themes.dart';
import 'package:flutter/material.dart';

import '../../widgets/CoddrAppBar.dart';

class CuratedContestHomePage extends StatefulWidget {
  final CuratedContestModel curatedContestModel;

  const CuratedContestHomePage({
    Key key,
    @required this.curatedContestModel,
  }) : super(key: key);
  @override
  _CuratedContestHomePageState createState() => _CuratedContestHomePageState();
}

class _CuratedContestHomePageState extends State<CuratedContestHomePage> {
  int _currentTabIndex = 0;
  Duration remaningTime;
  Timer _timer;
  ContestState contestState;
  void updateContestState() {
    DateTime currentTime = DateTime.now();
    if (currentTime.isAfter(widget.curatedContestModel.endTime))
      contestState = ContestState.finished;
    else if (currentTime.isAfter(widget.curatedContestModel.startTime))
      contestState = ContestState.started;
    else
      contestState = ContestState.notStarted;
  }

  @override
  void initState() {
    super.initState();

    // sets first value
    remaningTime =
        widget.curatedContestModel.startTime.difference(DateTime.now());
    updateContestState();

    // defines a timer
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      updateContestState();
      if (contestState == ContestState.finished) _timer.cancel();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget leftAppBarWidget = Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.dimen_16.w,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back_ios, color: Colors.black),
      ),
    );

    Widget middleAppBarWidget = Center(
        child:
            Text('Codeforces', style: Theme.of(context).textTheme.headline5));

    Widget rightAppBarWidget = Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.dimen_16.w,
      ),
      child: InkWell(
        onTap: () => {},
        child: Icon(
          Icons.info_rounded,
          color: Colors.black,
        ),
      ),
    );

    List<Widget> bottomNavigationWidgets = [
      ParticipantsPage(
        participants: widget.curatedContestModel.participants,
        totalSpots: widget.curatedContestModel.totalSpots,
        filledSpots: widget.curatedContestModel.filledSpots,
      ),
      PrizePoolPage(
          entryFees: widget.curatedContestModel.entryFees,
          prize: widget.curatedContestModel.prize,
          positionToReward: widget.curatedContestModel.positionToReward),
      LeaderBoardPage(
          curatedContestModel: widget.curatedContestModel,
          contestState: contestState),
      ResultPage(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CoddrAppBar(
        leftWidget: leftAppBarWidget,
        middleWidget: middleAppBarWidget,
        rightWidget: rightAppBarWidget,
      ),
      body: Column(
        children: [
          CuratedContestCardInfo(
            parentContestName: widget.curatedContestModel.parentContestName,
            contestName: widget.curatedContestModel.contestName,
            endTime: widget.curatedContestModel.endTime,
            startTime: widget.curatedContestModel.startTime,
            contestState: contestState,
          ),
          Expanded(child: bottomNavigationWidgets[_currentTabIndex]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.dustyGrey,
        currentIndex: _currentTabIndex,
        selectedItemColor: AppColor.purple1,
        selectedLabelStyle:
            ThemeText.bodyText2.copyWith(fontWeight: FontWeight.bold),
        onTap: (index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "Participants",
            icon: Image.asset(
              Images.participantsIcon,
              height: Sizes.dimen_60.w,
            ),
          ),
          BottomNavigationBarItem(
            label: "Prize Pool",
            icon: Image.asset(
              Images.trophyIcon,
              height: Sizes.dimen_60.w,
            ),
          ),
          BottomNavigationBarItem(
            label: "Leaderboard",
            icon: Image.asset(
              Images.leaderboardIcon,
              height: Sizes.dimen_60.w,
            ),
          ),
          BottomNavigationBarItem(
            label: "Rewards",
            icon: Image.asset(
              Images.rewardIcon,
              height: Sizes.dimen_60.w,
            ),
          )
        ],
      ),
    );
  }
}
