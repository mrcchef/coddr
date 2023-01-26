import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/enums/enum_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/presentation/themes/app_color.dart';
import 'package:coddr/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'WebViewPage.dart';

class CuratedContestCardInfo extends StatefulWidget {
  final DateTime startTime;
  final DateTime endTime;
  final String parentContestName;
  final String contestName;
  final ContestState contestState;
  CuratedContestCardInfo({
    @required this.startTime,
    @required this.endTime,
    @required this.parentContestName,
    @required this.contestName,
    @required this.contestState,
  });

  @override
  State<CuratedContestCardInfo> createState() => _CuratedContestCardInfoState();
}

class _CuratedContestCardInfoState extends State<CuratedContestCardInfo> {
  String getTimeContent() {
    String str;
    Duration remaningTime;
    DateTime currentTime = DateTime.now();
    int days, hours, minutes, seconds;
    const int daysDivisionFactor = 24 * 60 * 60;
    const int hoursDivisionFactor = 60 * 60;
    const int minutesDivisionFactor = 60;

    if (widget.contestState == ContestState.notStarted) {
      remaningTime = widget.startTime.difference(currentTime);
      seconds = remaningTime.inSeconds;
      days = (seconds / daysDivisionFactor).toInt();
      seconds = seconds % daysDivisionFactor;
      hours = (seconds / hoursDivisionFactor).toInt();
      seconds = seconds % hoursDivisionFactor;
      minutes = (seconds / minutesDivisionFactor).toInt();
      seconds = seconds % minutesDivisionFactor;

      str = "Starts in ${days}D : ${hours}H : ${minutes}M : ${seconds}S";
    } else if (widget.contestState == ContestState.started) {
      remaningTime = widget.endTime.difference(currentTime);
      str =
          "Ends in ${remaningTime.inDays}D:${remaningTime.inHours}H:${remaningTime.inMinutes}M:${remaningTime.inSeconds}S";
    } else {
      str = "Contest Ended";
    }

    return str;
  }

  @override
  Widget build(BuildContext context) {
    String getUrl() {
      String url = "https://codeforces.com/contests/";
      return url;
    }

    return Container(
        margin: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.dimen_40.w),
          color: AppColor.lightViolet,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: Sizes.dimen_20.w,
                  left: Sizes.dimen_16.w,
                  right: Sizes.dimen_16.w),
              child: Row(
                children: [
                  SizedBox(
                    width: Sizes.dimen_250.w,
                    child: Text(
                      widget.parentContestName,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: ThemeText.bodyText1
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    child: Icon(Icons.link),
                    onTap: () => Navigator.pushNamed(
                        context, WebViewPage.routeName,
                        arguments: {'url': getUrl()}),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
              child: Text(
                widget.contestName,
                style:
                    ThemeText.bodyText1.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
                child: Text(
                  'Duration: ${DateFormat('HH:mm').format(widget.startTime)} - ${DateFormat('HH:mm').format(widget.endTime)}',
                  style: ThemeText.subtitle1,
                )),
            Divider(
              height: Sizes.dimen_30.w,
              thickness: Sizes.dimen_2.w,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Sizes.dimen_16.w),
              child: Center(
                  child: Text(
                getTimeContent(),
                style: ThemeText.headline6,
              )),
            ),
          ],
        ));
  }
}
