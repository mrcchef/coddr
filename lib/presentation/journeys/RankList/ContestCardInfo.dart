import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/presentation/journeys/RankList/codeforces_website.dart';
import 'package:coddr/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:coddr/common/extensions/size_extensions.dart';

class ContestCardinfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.lightGreen,
      child: Column(
        children: [
          Center(
              child: Text(
                  'Educational  Codeforces Round 114\n(Rated for Div.2)',
                  textAlign: TextAlign.center)),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(Sizes.dimen_8.w),
                child: RaisedButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(CodeForcesWebsite.routeName),
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Sizes.dimen_20.w)),
                  child: Text(
                    'Redirect to website',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Contest Timing:\n20:00-22:00',
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
