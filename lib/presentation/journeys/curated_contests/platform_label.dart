import 'package:coddr/common/constants/image_constants.dart';
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
    return Stack(
      children: [
        Container(
          height: Sizes.dimen_60.w,
          color: Colors.black,
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, Sizes.dimen_8.w, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: Sizes.dimen_14),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Spacer(),
                  Image.asset(
                    Images.codeforcesLogo,
                    fit: BoxFit.fill,
                    height: Sizes.dimen_40.w,
                    width: Sizes.dimen_60.w,
                  ),

                  Text(
                    '   CodeForces',
                    style: TextStyle(
                        color: Colors.white, fontSize: Sizes.dimen_20.w),
                  ),
                  Spacer(),
                ],
              ),
            ),
            //This time we have to make dynamic
            // Text(
            //   '19h42m left',
            //   style: TextStyle(color: Colors.white, fontSize: Sizes.dimen_16.w),
            // )
          ],
        )
      ],
    );
  }
}
