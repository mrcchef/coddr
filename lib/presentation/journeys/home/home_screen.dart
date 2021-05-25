import 'package:coddr/presentation/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

import 'package:coddr/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:coddr/presentation/journeys/home/platform_grid.dart';
import 'package:coddr/common/screen_utils/screen_util.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';

import 'top_home_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);
    print(screenHeight);
    ScreenUtil.init(height: screenHeight, width: screenWidth);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.dimen_16.w,
              vertical: Sizes.dimen_8.h,
            ),
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.dimen_16.w,
              vertical: Sizes.dimen_8.h,
            ),
            child: Icon(
              Icons.notifications_active_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: Sizes.dimen_16.w,
                right: Sizes.dimen_16.w,
                top: Sizes.dimen_12.h),
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
                PlatformGrid(),
              ],
            ),
          ),
          CustomBottomNavigationBar(),
        ],
      ),
    );
  }
}
