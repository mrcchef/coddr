import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

class PHistory extends StatelessWidget {
  final int coins;
  final int contest;
  final int wins;

  const PHistory({
    Key key,
    @required this.coins,
    @required this.contest,
    @required this.wins,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Sizes.dimen_12.w),
      child: Container(
        height: Sizes.dimen_200.w,
        decoration: BoxDecoration(
            color: Color(0xFFD8FFCE),
            borderRadius: BorderRadius.circular(Sizes.dimen_30.w)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(Sizes.dimen_8.w),
              child: Text(
                'History',
                style:
                    TextStyle(fontSize: Sizes.dimen_20.w, color: Colors.black),
              ),
            ),
            Row(
              children: [
                Spacer(),
                Column(
                  children: [
                    Image.asset(
                      Images.coinsIcon,
                      height: Sizes.dimen_50.w,
                      width: Sizes.dimen_50.w,
                    ),
                    SizedBox(
                      height: Sizes.dimen_14.w,
                    ),
                    Text(
                      coins.toString(),
                      style: TextStyle(
                          fontSize: Sizes.dimen_14.w, color: Colors.black),
                    ),
                    Text(
                      'Coins',
                      style: TextStyle(
                          fontSize: Sizes.dimen_18.w,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Container(
                      height: Sizes.dimen_70.w,
                      width: Sizes.dimen_100.w,
                      child: Image.asset(
                        'assets/images/contest.png',
                      ),
                    ),
                    Text(
                      contest.toString(),
                      style: TextStyle(
                          fontSize: Sizes.dimen_14.w, color: Colors.black),
                    ),
                    Text(
                      'Contest',
                      style: TextStyle(
                          fontSize: Sizes.dimen_18.w,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Image.asset(
                      Images.trophyIcon,
                      height: Sizes.dimen_50.w,
                      width: Sizes.dimen_50.w,
                    ),
                    SizedBox(
                      height: Sizes.dimen_14.w,
                    ),
                    Text(
                      wins.toString(),
                      style: TextStyle(
                          fontSize: Sizes.dimen_14.w, color: Colors.black),
                    ),
                    Text(
                      'Wins',
                      style: TextStyle(
                          fontSize: Sizes.dimen_18.w,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
