import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/presentation/journeys/RankList/codeforces_website.dart';
import 'package:coddr/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContestCardinfo extends StatelessWidget {
  final DateTime startTime;
  final DateTime endTime;
  final String title;
  ContestCardinfo({
    @required this.startTime,
    @required this.endTime,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.lightGreen,
      child: Column(
        children: [
          Center(child: Text(title, textAlign: TextAlign.center)),
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
                  'Contest Timing:\n${DateFormat('HH:mm').format(startTime)} - ${DateFormat('HH:mm').format(endTime)}',
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
