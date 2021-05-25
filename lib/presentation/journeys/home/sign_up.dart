import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/screen_utils/screen_util.dart';
import 'package:coddr/presentation/journeys/home/sign_in.dart';
import 'package:coddr/presentation/widgets/log_in_container.dart';
import 'package:coddr/presentation/widgets/sign_up_container.dart';
import 'package:flutter/material.dart';
import 'package:coddr/common/extensions/size_extensions.dart';

class SignUp extends StatelessWidget {
  static const routeName = '/sign_up';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    ScreenUtil.init();
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Sizes.dimen_18.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: Sizes.dimen_14),
            child: Text(
              'Sign Up',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: Sizes.dimen_14),
            child: Text(
              'Get Ready to Cashify Your Coding Skills',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontSize: Sizes.dimen_16),
            ),
          ),
          // SizedBox(
          //   height: Sizes.dimen_20.h,
          // ),
          Center(
            child: Image.asset(
              Images.atcoderLogo,
              fit: BoxFit.cover,
              //height: Sizes.dimen_80.h,
              height: Sizes.dimen_100.h,
            ),
          ),
          SignUpContainer(),
          SizedBox(height: Sizes.dimen_18.h),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: Sizes.dimen_8),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SignIn.routeName);
                },
                child: Text('Already have an account? Sign In instead!'),
                // style: ButtonStyle(Theme.of(context).textTheme.button),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
