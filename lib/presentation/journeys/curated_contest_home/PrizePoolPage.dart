import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/presentation/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrizePoolPage extends StatelessWidget {
  final int entryFees;
  final int prize;
  final Map<String, int> positionToReward;

  const PrizePoolPage({
    Key key,
    @required this.entryFees,
    @required this.prize,
    @required this.positionToReward,
  }) : super(key: key);

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
                  'Prize Pool: ₹ $prize',
                  style:
                      ThemeText.bodyText1.copyWith(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  'Entry Fees: ₹ $entryFees',
                  style:
                      ThemeText.bodyText1.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                if (positionToReward.containsKey("1"))
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Sizes.dimen_4.w),
                    child: ListTile(
                      minVerticalPadding: Sizes.dimen_20.w,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Sizes.dimen_20.w)),
                      tileColor: Colors.yellow.shade100,
                      title: Center(
                        child: Text(
                          "Winner",
                          maxLines: 1,
                          style: ThemeText.bodyText1
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: Sizes.dimen_30.w,
                          backgroundImage: AssetImage(Images.firstPlaceRibbon)),
                      trailing: Container(
                        padding: EdgeInsets.all(Sizes.dimen_8.w),
                        decoration: new BoxDecoration(
                            gradient: RadialGradient(colors: [
                              Colors.yellow.shade100,
                              Colors.yellow.shade200,
                              Colors.orange.shade200,
                            ]),
                            borderRadius:
                                BorderRadius.circular(Sizes.dimen_60.w),
                            color: Colors.orange.shade300),
                        child: Text(
                          '₹ ${positionToReward['1'].toString()}',
                          style: ThemeText.headline6,
                        ),
                      ),
                    ),
                  ),
                if (positionToReward.containsKey("2"))
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Sizes.dimen_4.w),
                    child: ListTile(
                      minVerticalPadding: Sizes.dimen_20.w,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Sizes.dimen_20.w)),
                      tileColor: Colors.grey.shade200,
                      title: Center(
                        child: Text(
                          "Runner Up",
                          maxLines: 1,
                          style: ThemeText.bodyText1
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: Sizes.dimen_30.w,
                          backgroundImage:
                              AssetImage(Images.secondPlaceRibbon)),
                      trailing: Container(
                        padding: EdgeInsets.all(Sizes.dimen_8.w),
                        decoration: new BoxDecoration(
                            gradient: RadialGradient(colors: [
                              Colors.yellow.shade100,
                              Colors.yellow.shade200,
                              Colors.orange.shade200,
                            ]),
                            borderRadius:
                                BorderRadius.circular(Sizes.dimen_60.w),
                            color: Colors.orange.shade300),
                        child: Text(
                          '₹ ${positionToReward['2'].toString()}',
                          style: ThemeText.headline6,
                        ),
                      ),
                    ),
                  ),
                if (positionToReward.containsKey("3"))
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Sizes.dimen_4.w),
                    child: ListTile(
                      minVerticalPadding: Sizes.dimen_20.w,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Sizes.dimen_20.w)),
                      tileColor: Colors.brown.shade100,
                      title: Center(
                        child: Text(
                          "2nd Runner Up",
                          maxLines: 1,
                          style: ThemeText.bodyText1
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: Sizes.dimen_30.w,
                          backgroundImage: AssetImage(Images.thirdPlaceRibbon)),
                      trailing: Container(
                        padding: EdgeInsets.all(Sizes.dimen_8.w),
                        decoration: new BoxDecoration(
                            gradient: RadialGradient(colors: [
                              Colors.yellow.shade100,
                              Colors.yellow.shade200,
                              Colors.orange.shade200,
                            ]),
                            borderRadius:
                                BorderRadius.circular(Sizes.dimen_60.w),
                            color: Colors.orange.shade300),
                        child: Text(
                          '₹ ${positionToReward['3'].toString()}',
                          style: ThemeText.headline6,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
