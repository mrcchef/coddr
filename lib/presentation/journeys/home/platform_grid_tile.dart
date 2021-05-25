import 'package:flutter/material.dart';

import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';

class PlatformGridTile extends StatelessWidget {
  final Color color;
  final String title;
  final String imagePath;
  final double len;

  const PlatformGridTile({
    Key key,
    @required this.color,
    @required this.title,
    @required this.imagePath,
    this.len,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            height: Sizes.dimen_60.h,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
