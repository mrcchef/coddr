import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/presentation/blocs/email_verification/email_verification_bloc.dart';
import 'package:coddr/presentation/blocs/send_verification_email/send_verification_email_bloc.dart';
import 'package:coddr/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum verificationState { initial, verified, verifying, notVerified }
enum verificationEmailSentState { initial, sent, sending, failed }

class UserDetails extends StatefulWidget {
  final String displayName;
  final String contactNumber;
  final String email;
  final bool isEmailVerified;
  final String uid;
  UserDetails({
    @required this.displayName,
    @required this.contactNumber,
    @required this.email,
    @required this.uid,
    this.isEmailVerified = false,
  });

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  EmailVerificationBloc emailVerificationBloc;
  SendVerificationEmailBloc sendVerificationEmailBloc;

  @override
  initState() {
    emailVerificationBloc = getItInstance<EmailVerificationBloc>();
    sendVerificationEmailBloc = getItInstance<SendVerificationEmailBloc>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailVerificationBloc.close();
    sendVerificationEmailBloc.close();
  }

  Widget build(BuildContext context) {
    verificationEmailSentState vesstate = verificationEmailSentState.initial;
    verificationState vstate = verificationState.initial;

    if (widget.isEmailVerified) vstate = verificationState.verified;

    return BlocConsumer<SendVerificationEmailBloc, SendVerificationEmailState>(
      bloc: sendVerificationEmailBloc,
      listener: (context, state) {
        if (state is SendVerificationEmailSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Email successfully sent!"),
            backgroundColor: Colors.green,
          ));
        } else if (state is SendVerificationEmailFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Email sending failed! Try again!"),
            backgroundColor: Theme.of(context).errorColor,
          ));
        }
      },
      builder: (context, state) {
        if (state is SendVerificationEmailLoading)
          vesstate = verificationEmailSentState.sending;
        if (state is SendVerificationEmailSuccess) {
          vesstate = verificationEmailSentState.sent;
        }
        if (state is SendVerificationEmailFailed)
          vesstate = verificationEmailSentState.failed;

        return BlocConsumer<EmailVerificationBloc, EmailVerificationState>(
          bloc: emailVerificationBloc,
          listener: (context, state) {
            if (state is EmailVerificationDone) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Email Verification successful!"),
                backgroundColor: Colors.green,
              ));
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

            String verifyText = "verify";
            if (vstate == verificationState.verified) verifyText = "verified";
            print(vstate);
            return Column(children: [
              ListTile(
                title: Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColor.deepBlue,
                  ),
                ),
                subtitle: Text(
                  widget.displayName,
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                leading: CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage('assets/images/default_user.png'),
                ),
              ),
              ListTile(
                title: Text(
                  "Contact",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColor.deepBlue,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                subtitle: Text(
                  widget.contactNumber,
                  style: TextStyle(fontSize: 12, color: Colors.black),
                  textDirection: TextDirection.rtl,
                ),
                trailing: CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage('assets/images/img_2.png'),
                ),
              ),
              ListTile(
                title: Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColor.deepBlue,
                  ),
                ),
                subtitle: Text(
                  widget.email,
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                leading: CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage('assets/images/img_1.png'),
                ),
                trailing: TextButton.icon(
                  onPressed: () {
                    if (vstate == verificationState.notVerified) {
                      emailVerificationBloc
                          .add(VerifyEmailEvent(uid: widget.uid));
                    }
                  },
                  label: Text(
                    verifyText,
                    style: TextStyle(
                        color: vstate == verificationState.verified
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  icon: Icon(
                    vstate == verificationState.verified
                        ? FontAwesomeIcons.check
                        : FontAwesomeIcons.questionCircle,
                    color: vstate == verificationState.verified
                        ? Colors.green
                        : Colors.red,
                    size: 20,
                  ),
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: (vesstate ==
                                verificationEmailSentState.sending ||
                            vstate == verificationState.verified)
                        ? null
                        : () {
                            BlocProvider.of<SendVerificationEmailBloc>(context)
                                .add(SendVerificationEmail(uid: widget.uid));
                          },
                    child: vesstate == verificationEmailSentState.sending
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Text("Send Verification"),
                  ),
                  TextButton(
                    onPressed: (vstate == verificationState.verifying ||
                            vstate == verificationState.verified)
                        ? null
                        : () {
                            BlocProvider.of<EmailVerificationBloc>(context)
                                .add(VerifyEmailEvent(uid: widget.uid));
                          },
                    child: vstate == verificationState.verifying
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Text("Check Verification"),
                  ),
                ],
              )
            ]);
          },
        );
      },
    );
  }
}
