import 'package:coddr/common/constants/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:coddr/common/extensions/size_extensions.dart';

class Numberingrank extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Column(
      children:[
      Row(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: Sizes.dimen_22.w),
            child: Text('3'),
          ),
          Spacer(),
          Padding(
            padding:  EdgeInsets.only(right: Sizes.dimen_22.w),
            child: Text('400'),
          ),
        ],
      ),
        Divider(thickness: 1,)
      ]
    );

  }
}
