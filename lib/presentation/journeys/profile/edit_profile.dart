import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Widgets/PEditDetails.dart';
import 'Widgets/PEditImage.dart';
import 'Widgets/editHandles.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  GlobalKey<FormState> _formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            SizedBox(
              height: 25,
            ),
            PEditImage(),
            SizedBox(
              height: 25,
            ),
            PEditDetails(),
            Pedithandles(),
            SizedBox(
              height: 25,
            ),
            Center(
              child: RaisedButton(
                onPressed: () {},
                color: HexColor('#d91f2a'),
                child: Text(
                  'Save Changes',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
