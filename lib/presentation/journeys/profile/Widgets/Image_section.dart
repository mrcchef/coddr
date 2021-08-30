import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
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
            backgroundImage:
            AssetImage('assets/images/kshittiz2.jpg'),
          ),
        )
      ],
    );
  }
}
