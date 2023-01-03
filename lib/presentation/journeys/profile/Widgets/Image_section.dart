import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

import '../../../themes/app_color.dart';

// ignore: must_be_immutable
class ImageSection extends StatelessWidget {
  String imageUrl;
  final String displayName;
  final String contactNumber;
  final String email;
  ImageSection({
    @required this.imageUrl,
    @required this.displayName,
    @required this.contactNumber,
    @required this.email,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == "") imageUrl = 'https://stratosphere.co.in/img/user.jpg';

    return SizedBox(
      height: Sizes.dimen_150.h,
      child: Container(
        decoration: BoxDecoration(color: AppColor.lightBrown),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(
              top: Sizes.dimen_2.h,
              left: Sizes.dimen_18.w,
              right: Sizes.dimen_18.w,
            ),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(Sizes.dimen_1.w),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(Sizes.dimen_10.w)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(Sizes.dimen_70.w),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: Sizes.dimen_100.w,
                  child: Image.asset(
                    Images.verifiedBadgeIcon,
                    height: Sizes.dimen_40.w,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Sizes.dimen_4.h,
          ),
          ListTile(
            title: Text(
              "Name",
              style: TextStyle(
                fontSize: Sizes.dimen_18.w,
                fontWeight: FontWeight.bold,
                color: AppColor.deepBlue,
              ),
            ),
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            subtitle: Text(
              displayName,
              style: TextStyle(
                  fontSize: Sizes.dimen_14.w,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              radius: Sizes.dimen_24.w,
              backgroundImage: AssetImage(Images.userIcon),
            ),
          ),
          ListTile(
            title: Text(
              "Contact",
              style: TextStyle(
                fontSize: Sizes.dimen_18.w,
                fontWeight: FontWeight.bold,
                color: AppColor.deepBlue,
              ),
            ),
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            subtitle: Text(
              contactNumber,
              style: TextStyle(
                  fontSize: Sizes.dimen_14.w,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              radius: Sizes.dimen_24.w,
              backgroundImage: AssetImage(Images.phoneIcon),
            ),
          ),
          ListTile(
            title: Text(
              "Email",
              style: TextStyle(
                fontSize: Sizes.dimen_18.w,
                fontWeight: FontWeight.bold,
                color: AppColor.deepBlue,
              ),
            ),
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            subtitle: Text(
              email,
              style: TextStyle(
                  fontSize: Sizes.dimen_14.w,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              radius: Sizes.dimen_24.w,
              backgroundImage: AssetImage(Images.emailIcon),
            ),
          ),
        ]),
      ),
    );
  }
}
