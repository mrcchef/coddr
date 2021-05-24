import 'package:coddr/common/constants/size_constants.dart';
import 'package:flutter/material.dart';

import 'package:coddr/common/extensions/size_extensions.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Material(
          elevation: Sizes.dimen_200,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Sizes.dimen_16.w),
            topRight: Radius.circular(Sizes.dimen_16.w),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  size: Sizes.dimen_32.w,
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.home_outlined,
                  size: Sizes.dimen_32.w,
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.search,
                  size: Sizes.dimen_32.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
