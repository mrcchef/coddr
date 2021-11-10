import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coddr/common/extensions/size_extensions.dart';

class LeaderBoard extends StatelessWidget {
  final CuratedContestModel curatedContestModel;

  LeaderBoard({@required this.curatedContestModel});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Table(
          border: TableBorder.all(),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: <int, TableColumnWidth>{
            0: FixedColumnWidth(Sizes.dimen_40.w),
            1: FlexColumnWidth(),
            2: FixedColumnWidth(Sizes.dimen_50.w),
            3: FixedColumnWidth(Sizes.dimen_70.w),
            4: FixedColumnWidth(Sizes.dimen_80.w)
          },
          children: [
            TableRow(children: [
              Center(
                child: Text(
                  'Rank',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ),
              Center(
                  child: Text(
                'Userhandle',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              )),
              Center(
                  child: Text(
                'Points',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              )),
              Center(
                  child: Padding(
                padding:
                    EdgeInsets.fromLTRB(Sizes.dimen_7.w, 0, Sizes.dimen_7.w, 0),
                child: Text('Contest rank',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red)),
              )),
              Center(
                  child: Padding(
                padding:
                    EdgeInsets.fromLTRB(Sizes.dimen_7.w, 0, Sizes.dimen_7.w, 0),
                child: Text('Problems Solved',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red)),
              )),
            ]),
            // These two should be removed but since we can see leaderboard only during live contest 
            // so I havenn't removed them as of now
            TableRow(children: [
              Center(child: Text('1')),
              Center(child: Text('Abhijeet012')),
              Center(child: Text('130')),
              Center(child: Text('3')),
              Center(child: Text('10')),
            ]),
            TableRow(children: [
              Center(child: Text('2')),
              Center(child: Text('Kshitijj702')),
              Center(child: Text('200')),
              Center(child: Text('4')),
              Center(child: Text('12')),
            ]),
            TableRow(children: [
              ListView.builder(
                  itemCount: curatedContestModel.positionToUsername.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Center(child: Text((index + 1).toString()));
                  }),
              ListView.builder(
                  itemCount: curatedContestModel.positionToUsername.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Center(child: Text(curatedContestModel.positionToUsername[index+1]));
                  }),
              ListView.builder(
                  itemCount: curatedContestModel.positionToUsername.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Center(child: Text('300'));
                  }),
              ListView.builder(
                  itemCount: curatedContestModel.positionToUsername.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Center(child: Text('10'));
                  }),
              ListView.builder(
                  itemCount: curatedContestModel.positionToUsername.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Center(child: Text('6'));
                  }),
            ])
          ],
        )
      ],
    );
  }
}
