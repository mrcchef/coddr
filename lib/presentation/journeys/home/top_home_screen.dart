import 'package:flutter/material.dart';

import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';

class TopHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.dimen_62.h,
      child: Row(
        children: [
          Container(
            width: Sizes.dimen_200.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome,\nUser",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Container(
                  height: Sizes.dimen_1.h,
                  color: Colors.black,
                ),
                Text(
                  "Earn money with your skill",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Sizes.dimen_10.h),
                child: Image.asset(
                  Images.defaultUserImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
