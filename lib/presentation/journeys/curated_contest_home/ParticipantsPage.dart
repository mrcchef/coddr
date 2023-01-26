import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/presentation/themes/app_color.dart';
import 'package:coddr/presentation/themes/themes.dart';
import 'package:coddr/presentation/widgets/Loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/constants/size_constants.dart';

class ParticipantsPage extends StatelessWidget {
  final List<Map<String, String>> participants;
  final int totalSpots, filledSpots;

  ParticipantsPage({
    Key key,
    @required this.participants,
    @required this.totalSpots,
    @required this.filledSpots,
  }) : super(key: key);

  final List<Color> cardColors = [
    AppColor.lightGreen,
    AppColor.lightRed,
    AppColor.lightViolet,
    AppColor.lightBrown,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.dimen_16.w,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Sizes.dimen_16.w,
            ),
            child: Row(
              children: [
                Text(
                  'Total Spots: $totalSpots',
                  style:
                      ThemeText.bodyText1.copyWith(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  'Filled: $filledSpots',
                  style:
                      ThemeText.bodyText1.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: participants.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Sizes.dimen_20.w)),
                  tileColor: cardColors[index % cardColors.length],
                  title: Text(
                    participants[index]["displayName"],
                    maxLines: 1,
                    style: ThemeText.bodyText1
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    participants[index]["handelCF"],
                    maxLines: 1,
                    style: ThemeText.subtitle2,
                  ),
                  leading: Stack(children: [
                    Positioned.fill(
                        child: Align(
                      alignment: Alignment.center,
                      child: Loading(),
                    )),
                    CircleAvatar(
                        radius: Sizes.dimen_30.w,
                        backgroundColor: Colors.transparent,
                        backgroundImage:
                            NetworkImage(participants[index]['imageUrl']))
                  ]),
                  trailing: InkWell(child: Icon(Icons.link)),
                );
              }),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: Sizes.dimen_4.h,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
