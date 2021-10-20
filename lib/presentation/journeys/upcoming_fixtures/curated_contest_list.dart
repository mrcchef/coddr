import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/presentation/journeys/upcoming_fixtures/curated_contest_card.dart';
import 'package:flutter/material.dart';
import 'package:coddr/common/extensions/size_extensions.dart';


class CuratedContestList extends StatefulWidget {

  @override
  _CuratedContestListState createState() => _CuratedContestListState();
}

class _CuratedContestListState extends State<CuratedContestList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return Padding(
            padding:  EdgeInsets.all(Sizes.dimen_8.w),
            child: CuratedContestCard(),
          );
        });
  }
}
