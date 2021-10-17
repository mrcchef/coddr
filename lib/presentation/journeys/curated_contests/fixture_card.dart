import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

class FixtureCard extends StatelessWidget {
  final String total;
  final Color color;
  final String entry;
  final String remainingSpots;
  final String totalSpots;


  FixtureCard({
    @required this.total,
    @required this.color,
    @required this.entry,
    @required this.remainingSpots,
    @required this.totalSpots,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: Sizes.dimen_110.w,
        padding: EdgeInsets.symmetric(
          vertical: Sizes.dimen_12.w,
          horizontal: Sizes.dimen_14.w,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(Sizes.dimen_24.w),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text('Total Prize',
                    style: Theme.of(context).textTheme.headline6.copyWith(fontSize: Sizes.dimen_18.w,fontWeight: FontWeight.w500)),
                Spacer(),
                Text('Entry Fees',
                    style: Theme.of(context).textTheme.headline6.copyWith(fontSize: Sizes.dimen_18.w,fontWeight: FontWeight.w500)),
              ],
            ),
            Row(
              children: [
                Text('₹$total', style: Theme.of(context).textTheme.subtitle1),
                Spacer(),
                Text('₹$entry', style: Theme.of(context).textTheme.subtitle1),
              ],
            ),
            SizedBox(height: Sizes.dimen_8.w),
            Text(
              '$remainingSpots/$totalSpots Spots left',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontSize: Sizes.dimen_18.w,fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
