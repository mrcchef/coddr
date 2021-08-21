import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:coddr/common/extensions/size_extensions.dart';

class AppDialog extends StatelessWidget {
  final Function onPressed;

  const AppDialog({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.lightGreen,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.dimen_16.w)),
      elevation: Sizes.dimen_20,
      child: Padding(
        padding: EdgeInsets.all(Sizes.dimen_20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Please Verify your Email by clicking on the link sent to your Email Id",
              style: Theme.of(context).textTheme.headline6,
            ),
            ElevatedButton(
              onPressed: onPressed,
              child: Text(
                "Procced to HomeScreen",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
