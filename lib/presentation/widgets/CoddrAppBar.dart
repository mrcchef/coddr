import 'package:coddr/common/constants/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:coddr/common/extensions/size_extensions.dart';

class CoddrAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.dimen_16.w,
            vertical: Sizes.dimen_8.h,
          ),
          child: InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Icon(Icons.menu, color: Colors.black),
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(top: Sizes.dimen_6.h),
          child: Text('Coddr', style: Theme.of(context).textTheme.headline5),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.dimen_16.w,
            vertical: Sizes.dimen_8.h,
          ),
          child: Icon(
            Icons.notifications_active_outlined,
            color: Colors.black,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  //Size get preferredSize => throw UnimplementedError();
}
