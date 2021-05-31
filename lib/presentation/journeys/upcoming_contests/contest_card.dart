import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:coddr/common/extensions/size_extensions.dart';

class ContestCard extends StatelessWidget {
  final String title;
  final Color color;
  final String time;
  final String date;

  ContestCard({
    @required this.title,
    @required this.color,
    @required this.time,
    @required this.date,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Sizes.dimen_4.h,
      ),
      child: InkWell(
        onTap: () {},
        child: Card(
          //elevation: 5,
          color: color,
          //shadowColor: Colors.green.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.dimen_24.w),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  //horizontal: Sizes.dimen_4.w,
                  vertical: Sizes.dimen_4.h,
                ),
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: Sizes.dimen_16.w),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.dimen_16.w,
                  vertical: Sizes.dimen_4.h,
                ),
                child: Row(
                  children: [
                    Text(
                      time,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Spacer(),
                    Text(
                      date,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
