import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';

import 'package:coddr/presentation/journeys/home/platform_grid_tile.dart';
import 'package:coddr/common/extensions/size_extensions.dart';

class PlatformGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: Sizes.dimen_300.w,
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: Sizes.dimen_10.w,
            mainAxisSpacing: Sizes.dimen_10.h,
            childAspectRatio: 0.9,
          ),
          children: [
            PlatformGridTile(
              title: 'Codeforces',
              color: AppColor.lightViolet,
              imagePath: Images.codeforcesLogo,
            ),
            PlatformGridTile(
              title: 'CodeChef',
              color: AppColor.lightRed,
              imagePath: Images.codeChefLogo,
            ),
            PlatformGridTile(
              title: 'Hacker Earth',
              color: AppColor.lightBrown,
              imagePath: Images.hackerEarthLogo,
            ),
            PlatformGridTile(
              title: 'AtCoder',
              color: AppColor.lightGreen,
              imagePath: Images.atcoderLogo,
            ),
          ],
        ),
      ),
    );
  }
}
