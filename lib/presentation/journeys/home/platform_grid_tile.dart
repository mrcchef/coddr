import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

class PlatformGridTile extends StatelessWidget {
  final Color color;
  final String title;
  final String imagePath;
  final double len;
  final Function function;

  const PlatformGridTile({
    Key key,
    @required this.color,
    @required this.title,
    @required this.imagePath,
    @required this.function,
    this.len,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            Sizes.dimen_10.h,
          ),
        ),
        padding: EdgeInsets.symmetric(
            vertical: Sizes.dimen_12.w, horizontal: Sizes.dimen_12.w),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: Sizes.dimen_120.w,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
