import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/screen_utils/screen_util.dart';
import 'package:coddr/presentation/journeys/auth/sign_up_screen.dart';
import 'package:coddr/presentation/journeys/auth/sign_in_container.dart';
import 'package:flutter/material.dart';
import 'package:coddr/common/extensions/size_extensions.dart';

class SignInScreen extends StatelessWidget {
  static const routeName = '/sign_in_screen';

  @override
  Widget build(BuildContext context) {
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
              'Sign In',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: Sizes.dimen_14),
            child: Text(
              'Nice to see you again!',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontSize: Sizes.dimen_20),
            ),
          ),
          SizedBox(
            height: Sizes.dimen_20.h,
          ),
          Center(
            child: Image.asset(
              Images.atcoderLogo,
              fit: BoxFit.cover,
              //height: Sizes.dimen_80.h,
              height: Sizes.dimen_100.h,
            ),
          ),
          LogInContainer(),
          SizedBox(height: Sizes.dimen_18.h),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: Sizes.dimen_8),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SignUpScreen.routeName);
                },
                child: Text('Dont have an account? Sign up instead!'),
                // style: ButtonStyle(Theme.of(context).textTheme.button),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
