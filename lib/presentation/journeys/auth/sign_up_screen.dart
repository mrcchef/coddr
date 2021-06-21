import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/screen_utils/screen_util.dart';
import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/domain/usecases/sign_up.dart';
import 'package:coddr/presentation/blocs/signup/signup_bloc.dart';
import 'package:coddr/presentation/journeys/auth/sign_in_screen.dart';
import 'package:coddr/presentation/journeys/auth/sign_in_container.dart';
import 'package:coddr/presentation/journeys/auth/sign_up_container.dart';
import 'package:flutter/material.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign_up_screen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpBloc _signUpBloc;

  @override
  void initState() {
    super.initState();
    _signUpBloc = getItInstance<SignUpBloc>();
  }

  @override
  void dispose() {
    _signUpBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);
    print(screenHeight);
    ScreenUtil.init(height: screenHeight, width: screenWidth);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Sizes.dimen_18.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: Sizes.dimen_14.w),
            child: Text(
              'Sign Up',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: Sizes.dimen_14.w),
            child: Text(
              'Get Ready to Cashify Your Coding Skills',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontSize: Sizes.dimen_16),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(Sizes.dimen_14.w),
            child: Center(
              child: Image.asset(
                Images.atcoderLogo,
                fit: BoxFit.cover,
                height: Sizes.dimen_150.w,
              ),
            ),
          ),
          BlocProvider.value(value: _signUpBloc, child: SignUpContainer()),
          SizedBox(height: Sizes.dimen_18.w),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: Sizes.dimen_8.w),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).popAndPushNamed(SignInScreen.routeName);
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
