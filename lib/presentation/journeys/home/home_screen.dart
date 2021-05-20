import 'package:flutter/material.dart';

import 'package:coddr/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:coddr/presentation/journeys/home/platform_grid.dart';
import 'package:coddr/common/screen_utils/screen_util.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';

import 'top_home_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: Sizes.dimen_16,
                right: Sizes.dimen_16,
                top: Sizes.dimen_12),
            child: Column(
              children: [
                TopHomeScreen(),
                SizedBox(
                  height: Sizes.dimen_18.h,
                ),
                Text(
                  "Get Started with your favourite platform",
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: Sizes.dimen_200.h, child: PlatformGrid()),
              ],
            ),
          ),
          CustomBottomNavigationBar(),
        ],
      ),
    );
  }
}
