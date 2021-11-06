import 'package:coddr/presentation/blocs/handel_verification/handel_verification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class PHandles extends StatelessWidget {
  final String handelCF, handelCC, handelHE, email, uid;
  final bool isHandelCFVerified;

  PHandles({
    Key key,
    @required this.handelCF,
    @required this.handelCC,
    @required this.handelHE,
    @required this.email,
    @required this.isHandelCFVerified,
    @required this.uid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget unVerifiedHandelButton = TextButton.icon(
      onPressed: () {
        BlocProvider.of<HandelVerificationBloc>(context)
            .add(VerifyCFHandelEvent(
          handel: handelCF,
          email: email,
          platformId: "CF",
          uid: uid,
        ));
      },
      icon: Icon(
        FontAwesomeIcons.questionCircle,
        color: Colors.red,
        size: 20,
      ),
      label: Text(
        'Verify',
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
    );

    final Widget verifiedHandelButton = TextButton.icon(
      onPressed: () {},
      icon: Icon(
        FontAwesomeIcons.checkCircle,
        color: Colors.green,
        size: 20,
      ),
      label: Text(
        'Verified',
        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
      ),
    );

    Widget cfHandelTrailingWidget =
        (isHandelCFVerified) ? verifiedHandelButton : unVerifiedHandelButton;
    print(isHandelCFVerified);
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
              color: HexColor('FDD9D9'),
              borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 0),
                child: Text(
                  'Handles',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              BlocBuilder<HandelVerificationBloc, HandelVerificationState>(
                builder: (context, state) {
                  if (state is HandelVerificationLoading)
                    cfHandelTrailingWidget = CircularProgressIndicator();
                  else if (state is HandelVerificationCFEmailPrivate) {
                    cfHandelTrailingWidget = unVerifiedHandelButton;
                  } else if (state is HandelVerificationCompleted) {
                    cfHandelTrailingWidget = verifiedHandelButton;
                  }
                  return ListTile(
                    minVerticalPadding: 0,
                    title: Text(
                      "CodeForces",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: HexColor('0B2FB0')),
                    ),
                    subtitle: Text(
                      handelCF,
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: cfHandelTrailingWidget,
                  );
                },
              ),
              ListTile(
                minVerticalPadding: 0,
                title: Text(
                  "CodeChef",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: HexColor('0B2FB0')),
                ),
                subtitle: Text(
                  handelCC,
                  style: TextStyle(color: Colors.black),
                ),
                trailing: TextButton.icon(
                  onPressed: () {},
                  label: Text(
                    'Verify',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  icon: Icon(
                    FontAwesomeIcons.questionCircle,
                    color: Colors.red,
                    size: 20,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'HackerEarth',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: HexColor('0B2FB0')),
                ),
                subtitle: Text(
                  handelHE,
                  style: TextStyle(color: Colors.black),
                ),
                trailing: TextButton.icon(
                  onPressed: () {},
                  label: Text(
                    'Verify',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  icon: Icon(
                    FontAwesomeIcons.questionCircle,
                    color: Colors.red,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
