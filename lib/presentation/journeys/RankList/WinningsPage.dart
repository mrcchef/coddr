import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:flutter/material.dart';

class WinningsPage extends StatelessWidget {
  final CuratedContestModel curatedContestModel;

  WinningsPage({@required this.curatedContestModel});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          // color: Colors.green,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    Sizes.dimen_18.w, Sizes.dimen_8.w, 0, Sizes.dimen_0.w),
                child: Text('#Rank'),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    0, Sizes.dimen_8.w, Sizes.dimen_18.w, Sizes.dimen_0.w),
                child: Text('Winnings'),
              )
            ],
          ),
        ),
        Divider(
          thickness: 3,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: Sizes.dimen_22.w),
              child: Text('1'),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: Sizes.dimen_22.w),
              child: Text(curatedContestModel.positionToReward['1'].toString()),
            ),
          ],
        ),
        Divider(
          thickness: 1,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: Sizes.dimen_22.w),
              child: Text('2'),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: Sizes.dimen_22.w),
              child: Text(curatedContestModel.positionToReward['2'].toString()),
            ),
          ],
        ),
        Divider(
          thickness: 1,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: Sizes.dimen_22.w),
              child: Text('3'),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: Sizes.dimen_22.w),
              child: Text(curatedContestModel.positionToReward['3'].toString()),
            ),
          ],
        ),
        Divider(
          thickness: 1,
        ),
        // ListView.builder(
        //     itemCount: 19,
        //     shrinkWrap: true,
        //     physics: const NeverScrollableScrollPhysics(),
        //     itemBuilder: (_, index) {
        //       return Numberingrank();
        //     })
      ],
    );
  }
}
