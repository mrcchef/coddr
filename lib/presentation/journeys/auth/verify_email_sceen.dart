import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/domain/usecases/get_uid.dart';
import 'package:coddr/presentation/blocs/email_verification/email_verification_bloc.dart';
import 'package:coddr/presentation/journeys/auth/complete_profile.dart';
import 'package:coddr/presentation/themes/app_color.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/image_constants.dart';
import '../../../common/constants/size_constants.dart';
import '../../blocs/send_verification_email/send_verification_email_bloc.dart';

enum verificationState { initial, verified, verifying, notVerified }

class VerifyEmailScreen extends StatefulWidget {
  static const routeName = '/verify_email_screen';
  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  GetUid getUid;
  SendVerificationEmailBloc sendVerificationEmailBloc;
  EmailVerificationBloc emailVerificationBloc;

  @override
  void initState() {
    getUid = getItInstance<GetUid>();
    sendVerificationEmailBloc = getItInstance<SendVerificationEmailBloc>();
    sendVerificationEmailBloc.add(SendVerificationEmail(uid: getUid()));
    emailVerificationBloc = getItInstance<EmailVerificationBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    verificationState vstate = verificationState.initial;
    final arg = ModalRoute.of(context).settings.arguments as Map;
    String email = arg['email'];
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<EmailVerificationBloc, EmailVerificationState>(
          bloc: emailVerificationBloc,
          listener: (context, state) {
            if (state is EmailVerificationDone) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Email Verification successful!"),
                backgroundColor: Colors.green,
              ));
              Navigator.of(context)
                  .popAndPushNamed(CompleteProfile.routeName, arguments: {
                'email': email,
              });
            }
            if (state is EmailVerificationFailed) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Email Verification Failed!"),
                backgroundColor: Theme.of(context).errorColor,
              ));
            }
          },
          builder: (context, state) {
            if (state is EmailVerificationLoading)
              vstate = verificationState.verifying;

            if (state is EmailVerificationDone)
              vstate = verificationState.verified;

            if (state is EmailVerificationFailed)
              vstate = verificationState.notVerified;

            print(vstate);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Sizes.dimen_30.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: Sizes.dimen_14.w),
                  child: Text(
                    'Verify Email',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Sizes.dimen_14.w),
                  child: Text(
                    'To continue, Please verify your email!',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontSize: Sizes.dimen_16),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Sizes.dimen_20.h,
                    horizontal: Sizes.dimen_14.w,
                  ),
                  child: Center(
                    child: Image.asset(
                      Images.emailIcon,
                      fit: BoxFit.cover,
                      height: Sizes.dimen_150.w,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Sizes.dimen_14.w),
                  child: Text(
                    'A verification mail is sent to your email',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontSize: Sizes.dimen_16),
                  ),
                ),
                SizedBox(
                  height: Sizes.dimen_20.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () async {
                        await LaunchApp.openApp(
                          androidPackageName: 'com.google.android.gm',
                          openStore: true,
                        );
                      },
                      child: Text(
                        "Open Email",
                        style: TextStyle(color: Colors.brown),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: AppColor.lightBrown,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Sizes.dimen_10.w),
                          )),
                    ),
                    TextButton(
                      onPressed: () {
                        BlocProvider.of<EmailVerificationBloc>(context)
                            .add(VerifyEmailEvent(uid: getUid()));
                      },
                      child: Text(
                        "Check Status",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: AppColor.lightViolet,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Sizes.dimen_10.w),
                          )),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
