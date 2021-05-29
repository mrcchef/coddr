import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/presentation/journeys/auth/sign_in_screen.dart';
import 'package:coddr/presentation/widgets/drawer_list_tile.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Sizes.dimen_14.h),
            Container(
              height: Sizes.dimen_140.w,
              width: double.infinity,
              padding: EdgeInsets.only(
                top: Sizes.dimen_20.w,
                left: Sizes.dimen_20.w,
              ),
              alignment: Alignment.centerLeft,
              child: ClipOval(
                child: Image.asset(
                  Images.defaultUserImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Sizes.dimen_30.w,
              ),
              child: Text(
                "User Name",
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.start,
              ),
            ),
            DrawerListTile('Profile', Icons.person_outline_outlined, () {}),
            DrawerListTile('Activity', Icons.timeline, () {}),
            DrawerListTile('Settings', Icons.settings, () {}),
            DrawerListTile(
                'About Us', Icons.sentiment_satisfied_alt_outlined, () {}),
            DrawerListTile('Sign Out', Icons.logout, () {
              Navigator.of(context).pushNamed(SignIn.routeName);
            }),
          ],
        ),
      ),
    );
  }
}
