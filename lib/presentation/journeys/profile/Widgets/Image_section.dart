import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  final String imageUrl;
  ImageSection(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 190,
              width: double.infinity,
              child: Image.asset(
                'assets/images/coding.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 56,
            )
          ],
        ),
        Positioned(
          top: 125,
          right: 135,
          child: CircleAvatar(
            radius: 60,
            backgroundImage: (imageUrl != "")
                ? NetworkImage(imageUrl)
                : NetworkImage('https://stratosphere.co.in/img/user.jpg'),
          ),
        ),
        Positioned(
          top: 125,
          right: 135,
          child: Image.asset(
            Images.verifiedBadgeIcon,
            height: Sizes.dimen_40.w,
          ),
        ),
      ],
    );
  }
}
