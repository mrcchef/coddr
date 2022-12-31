import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/common/screen_utils/screen_util.dart';
import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/presentation/blocs/signup/signup_bloc.dart';
import 'package:coddr/presentation/journeys/auth/sign_in_screen.dart';
import 'package:coddr/presentation/journeys/auth/sign_up_container.dart';
import 'package:coddr/presentation/journeys/auth/verify_email_sceen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign_up_screen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpBloc signUpBloc;

  @override
  void initState() {
    super.initState();
    signUpBloc = getItInstance<SignUpBloc>();
  }

  @override
  void dispose() {
    signUpBloc.close();
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
        child: BlocConsumer<SignUpBloc, SignUpState>(
          bloc: signUpBloc,
          listener: (context, state) {
            if (state is SignUpStateFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('SignUp Falied')));
            } else if (state is SignUpStateVerifying) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:
                    Text('Verify Email through the link sent to your email'),
                backgroundColor: Theme.of(context).errorColor,
              ));
            } else if (state is SignUpStateSuccess) {
              print("Entered signup consumer");
              Navigator.of(context)
                  .pushReplacementNamed(VerifyEmailScreen.routeName);
              // Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
              // BlocProvider.of<AuthenticationBloc>(context)
              //     .add(SiggnedInEvent());
            }
          },
          builder: (context, state) {
            return Column(
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
                BlocProvider.value(value: signUpBloc, child: SignUpContainer()),
                SizedBox(height: Sizes.dimen_18.w),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: Sizes.dimen_8.w),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .popAndPushNamed(SignInScreen.routeName);
                      },
                      child: Text('Already have an account? Sign In instead!'),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
