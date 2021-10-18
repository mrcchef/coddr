import 'package:coddr/common/constants/image_constants.dart';
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
                //imageUrl
                fit: BoxFit.cover,
              ),
              // child: Image.network(
              //   imageUrl,
              // ),
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
            //backgroundImage: AssetImage('assets/images/kshittiz2.jpg'),
          ),
        )
      ],
    );
  }
}
