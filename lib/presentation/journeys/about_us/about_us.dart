import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/presentation/widgets/CoddrAppBar.dart';
import 'package:flutter/material.dart';

import 'team_card.dart';

class AboutUs extends StatelessWidget {
  static const routeName = '/about-us';
  @override
  Widget build(BuildContext context) {
    Widget leftAppBarWidget = InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Icon(Icons.arrow_back_ios, color: Colors.black),
    );

    Widget middleAppBarWidget = Padding(
      padding: EdgeInsets.only(top: Sizes.dimen_6.h),
      child: Text('About Us', style: Theme.of(context).textTheme.headline5),
    );

    Widget rightAppBarWidget = Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.dimen_16.w,
        vertical: Sizes.dimen_8.h,
      ),
      child: Icon(
        Icons.notifications_active_outlined,
        color: Colors.black,
      ),
    );
    return Scaffold(
      appBar: CoddrAppBar(
        leftWidget: leftAppBarWidget,
        middleWidget: middleAppBarWidget,
        rightWidget: rightAppBarWidget,
      ),
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Center(
                child: Text(
                  'Indroduction',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'We are a Team of 4 prefinal year student at IIIT Vadodara persuing Bachelours in Technology.\nWe have developed the application Coddr because we felt that the journey of excelling DSA is not very motivating and in order to motivates the folks fursuing DSA by awarding then some incentives on the bases of thier excellence in the DSA.\nIn our platform students can competite with other students both in personlised as well as public contests. ',
                  style: Theme.of(context).textTheme.bodyText2),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Center(
                child: Text(
                  'OUR TEAM',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TeamCard(
                  fName: 'Abhijeet',
                  lName: 'Tamrakar',
                  image: Images.abhijeetImage,
                ),
                TeamCard(
                    fName: 'Kshittiz',
                    lName: 'Bhardwaj',
                    image: Images.kshittizImage),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
