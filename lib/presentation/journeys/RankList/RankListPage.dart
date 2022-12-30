import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/presentation/journeys/RankList/ContestCardInfo.dart';
import 'package:coddr/presentation/journeys/RankList/LeaderboardPage.dart';
import 'package:coddr/presentation/journeys/RankList/WinningsPage.dart';
import 'package:coddr/presentation/journeys/curated_contests/curated_contest_card.dart';
import 'package:coddr/presentation/journeys/curated_contests/platform_label.dart';
import 'package:flutter/material.dart';

class RankListPage extends StatefulWidget {
  final CuratedContestModel curatedContestModel;

  const RankListPage({
    Key key,
    @required this.curatedContestModel,
  }) : super(key: key);
  @override
  _RankListPageState createState() => _RankListPageState();
}

class _RankListPageState extends State<RankListPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(children: [
            PlatformLabel(),
            ContestCardinfo(
              startTime: widget.curatedContestModel.startTime,
              endTime: widget.curatedContestModel.endTime,
              title: widget.curatedContestModel.parentContestName,
            ),
            CuratedContestCard(
              curatedContestModel: widget.curatedContestModel,
              isPrivate: false,
              userModel: null,
            ),
            SizedBox(
              height: Sizes.dimen_50.w,
              child: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        'Winnings',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Leaderboard',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  WinningsPage(curatedContestModel: widget.curatedContestModel),
                  LeaderBoard(curatedContestModel: widget.curatedContestModel),
                ],
              ),
            )
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.INFO_REVERSED,
              borderSide:
                  BorderSide(color: Colors.green, width: Sizes.dimen_2.w),
              width: 400,
              buttonsBorderRadius:
                  BorderRadius.all(Radius.circular(Sizes.dimen_2.w)),
              headerAnimationLoop: true,
              animType: AnimType.BOTTOMSLIDE,
              title: 'Judging Criteria:',
              desc: "1. All the problems have same points alloted to them.\n"
                  "2. Users are ranked according to the most problems solved. There are no tie-breaks.\n"
                  "3. You can submit solutions as many times as you'd like, there are no penalties for incorrect submissions. Only your first correct submission will be considered.\n"
                  "4. The decision of the organizers in declaring the results will be final. No queries in this regard will be entertained\n"
                  "5. Any participant found to be indulging in any form of malpractice will be immediately disqualified.",
              showCloseIcon: true,
              // btnCancelOnPress: () {},
              btnOkOnPress: () {},
            )..show();
          },
          child: Icon(
            Icons.info_rounded,
            size: Sizes.dimen_40.w,
          ),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
