import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/presentation/themes/app_color.dart';
import 'package:coddr/presentation/widgets/CoddrAppBar.dart';
import 'package:coddr/presentation/widgets/main_drawer.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

import 'fixture_card.dart';

class UpcomingFixturesScreen extends StatelessWidget {
  static const routeName = '/upcoming_fixtures_screen';

  final List<Color> cardColors = [
    AppColor.lightGreen,
    AppColor.lightRed,
    AppColor.lightViolet,
    AppColor.lightBrown,
  ];

  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context).settings.arguments as String;
    print(title);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CoddrAppBar(),
      drawer: MainDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_16.w,
          vertical: Sizes.dimen_8.w,
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontSize: Sizes.dimen_20.w),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '12 h 25m 44s left',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontSize: Sizes.dimen_20.w, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Sizes.dimen_10.w),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.dimen_16.w,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Available Fixtures',
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
                ),
                SizedBox(height: Sizes.dimen_22.w),
                FixtureCard(
                  total: '1000',
                  entry: '50',
                  remainingSpots: '10',
                  totalSpots: '20',
                  color: cardColors[0],
                ),
                SizedBox(height: Sizes.dimen_20.w),
                FixtureCard(
                  total: '1000',
                  entry: '50',
                  remainingSpots: '10',
                  totalSpots: '20',
                  color: cardColors[1],
                ),
                SizedBox(height: Sizes.dimen_20.w),
                FixtureCard(
                  total: '1000',
                  entry: '50',
                  remainingSpots: '10',
                  totalSpots: '20',
                  color: cardColors[2],
                ),
                SizedBox(height: Sizes.dimen_20.w),
                FixtureCard(
                  total: '1000',
                  entry: '50',
                  remainingSpots: '10',
                  totalSpots: '20',
                  color: cardColors[3],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
