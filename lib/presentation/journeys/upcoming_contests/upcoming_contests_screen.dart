import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/screen_utils/screen_util.dart';
import 'package:coddr/presentation/journeys/upcoming_contests/contest_card.dart';
import 'package:coddr/presentation/themes/app_color.dart';
import 'package:coddr/presentation/widgets/CoddrAppBar.dart';
import 'package:coddr/presentation/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:coddr/common/extensions/size_extensions.dart';

class UpcomingContestsScreen extends StatelessWidget {
  static const routeName = '/upcoming_contests_screen';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    ScreenUtil.init(height: screenHeight, width: screenWidth);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CoddrAppBar(),
      drawer: MainDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_16.w,
          vertical: Sizes.dimen_8.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Upcoming Contests',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontSize: Sizes.dimen_26.w),
                  ),
                  Spacer(),
                  Image.asset(
                    Images.codeforcesLogo,
                    //fit: BoxFit.fitHeight,
                    height: Sizes.dimen_48.w,
                    width: Sizes.dimen_48.w,
                  ),
                ],
              ),
              SizedBox(height: Sizes.dimen_8.h),
              //ListView.builder(itemBuilder: itemBuilder)
              ContestCard(
                title: 'Educational Codeforces Round 101',
                color: AppColor.lightGreen,
                time: '8:05 - 10-20',
                date: '30/05/2021'
              ),
              ContestCard(
                title: 'Codeforces Round 723 (Div 2)',
                color: AppColor.lightRed,
                time: '8:05 - 10-20',
                date: '30/05/2021'
              ),
              ContestCard(
                title: 'Educational Codeforces Round 102',
                color: AppColor.lightViolet,
                time: '8:05 - 10-20',
                date: '30/05/2021'
              ),
              ContestCard(
                title: 'Codeforces Round 724 (Div 2)',
                color: AppColor.lightBrown,
                time: '8:05 - 10-20',
                date: '30/05/2021'
              ),
            ],
          ),
        ),
      ),
    );
  }
}

