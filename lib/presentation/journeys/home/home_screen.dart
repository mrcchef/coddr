import 'package:flutter/material.dart';

import 'package:coddr/common/screen_utils/screen_util.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.dimen_16,
              vertical: Sizes.dimen_8,
            ),
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.dimen_16,
              vertical: Sizes.dimen_8,
            ),
            child: Icon(
              Icons.notifications_active_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Sizes.dimen_16, vertical: Sizes.dimen_12),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: Sizes.dimen_150.h,
                  width: Sizes.dimen_150.w,
                  child: Column(
                    children: [
                      Text(
                        "Welcome,\nUser",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Container(
                        width: Sizes.dimen_150.w,
                        height: Sizes.dimen_1.h,
                        color: Colors.black,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
