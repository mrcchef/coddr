import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/presentation/blocs/email_verification/email_verification_bloc.dart';
import 'package:coddr/presentation/blocs/send_verification_email/send_verification_email_bloc.dart';
import 'package:coddr/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  final String displayName;
  final String contactNumber;
  final String email;

  UserDetails({
    @required this.displayName,
    @required this.contactNumber,
    @required this.email,
  });

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  EmailVerificationBloc emailVerificationBloc;
  SendVerificationEmailBloc sendVerificationEmailBloc;

  @override
  initState() {
    super.initState();
    emailVerificationBloc = getItInstance<EmailVerificationBloc>();
    sendVerificationEmailBloc = getItInstance<SendVerificationEmailBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    emailVerificationBloc.close();
    sendVerificationEmailBloc.close();
  }

  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        title: Text(
          "Name",
          style: TextStyle(
            fontSize: Sizes.dimen_14.w,
            fontWeight: FontWeight.bold,
            color: AppColor.deepBlue,
          ),
        ),
        subtitle: Text(
          widget.displayName,
          style: TextStyle(fontSize: Sizes.dimen_12.w, color: Colors.black),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          radius: Sizes.dimen_24.w,
          backgroundImage: AssetImage(Images.userIcon),
        ),
      ),
      ListTile(
        title: Text(
          "Contact",
          style: TextStyle(
            fontSize: Sizes.dimen_14.w,
            fontWeight: FontWeight.bold,
            color: AppColor.deepBlue,
          ),
        ),
        subtitle: Text(
          widget.contactNumber,
          style: TextStyle(fontSize: Sizes.dimen_12.w, color: Colors.black),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          radius: Sizes.dimen_24.w,
          backgroundImage: AssetImage(Images.phoneIcon),
        ),
      ),
      ListTile(
        title: Text(
          "Email",
          style: TextStyle(
            fontSize: Sizes.dimen_14.w,
            fontWeight: FontWeight.bold,
            color: AppColor.deepBlue,
          ),
        ),
        subtitle: Text(
          widget.email,
          style: TextStyle(fontSize: Sizes.dimen_12.w, color: Colors.black),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          radius: Sizes.dimen_24.w,
          backgroundImage: AssetImage(Images.emailIcon),
        ),
      ),
    ]);
  }
}
