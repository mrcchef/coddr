import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/presentation/journeys/upcoming_fixtures/fixturecardnew.dart';
import 'package:flutter/material.dart';
import 'package:coddr/common/extensions/size_extensions.dart';


class FixturesList extends StatefulWidget {

  @override
  _FixturesListState createState() => _FixturesListState();
}

class _FixturesListState extends State<FixturesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return Padding(
            padding:  EdgeInsets.all(Sizes.dimen_8.w),
            child: FixtureCardNew(),
          );
        });
  }
}
