import 'package:coddr/common/constants/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:coddr/common/extensions/size_extensions.dart';


class PlatformLabel extends StatefulWidget {

  @override
  _PlatformLabelState createState() => _PlatformLabelState();
}

class _PlatformLabelState extends State<PlatformLabel> {
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          height: Sizes.dimen_80.w,
          color: Colors.black,
        ),
        Column(
          children: [
            Padding(
              padding:  EdgeInsets.fromLTRB(0, Sizes.dimen_8.w, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logos/HackerRank.png',
                    fit: BoxFit.fill,
                    height: Sizes.dimen_40.w,
                    width: Sizes.dimen_60.w,
                  ),
                  Text(
                    'HackerRank',
                    style: TextStyle(color: Colors.white, fontSize: Sizes.dimen_20.w),
                  )
                ],
              ),
            ),
            Text('19h42m left',
                style: TextStyle(color: Colors.white, fontSize: Sizes.dimen_16.w))
          ],
        )
      ],
    );
  }
}
