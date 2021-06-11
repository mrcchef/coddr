import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/screen_utils/screen_util.dart';
import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/presentation/blocs/signIn/signin_bloc.dart';
import 'package:coddr/presentation/journeys/auth/sign_up_screen.dart';
import 'package:coddr/presentation/journeys/auth/sign_in_container.dart';
import 'package:flutter/material.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/sign_in_screen';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  SignInBloc _signInBloc;

  @override
  void initState() {
    super.initState();
    _signInBloc = getItInstance<SignInBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    _signInBloc.close();
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
            height: Sizes.dimen_30.w,
          ),
          Padding(
            padding: EdgeInsets.only(left: Sizes.dimen_14.w),
            child: Text(
              'Sign In',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: Sizes.dimen_14.w),
            child: Text(
              'Nice to see you again!',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontSize: Sizes.dimen_20),
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
          BlocProvider.value(value: _signInBloc, child: LogInContainer()),
          SizedBox(height: Sizes.dimen_18.w),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: Sizes.dimen_8.w),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).popAndPushNamed(SignUpScreen.routeName);
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
