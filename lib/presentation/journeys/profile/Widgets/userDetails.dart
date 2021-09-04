import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class UserDetails extends StatelessWidget {
  final String displayName;
  final String contactNumber;
  final String email;
  UserDetails({
    @required this.displayName,
    @required this.contactNumber,
    @required this.email,
  });

  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            "Name",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: HexColor('0B2FB0')),
          ),
          subtitle: Text(
            displayName,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          leading: CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage('assets/images/img.png'),
          ),
        ),
        ListTile(
          title: Text(
            "Contact",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: HexColor('0B2FB0')),
            textDirection: TextDirection.rtl,
          ),
          subtitle: Text(
            contactNumber,
            style: Theme.of(context).textTheme.bodyText1,
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
                color: HexColor('0B2FB0')),
          ),
          subtitle: Text(
            email,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          leading: CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage('assets/images/img_1.png'),
          ),
          trailing: TextButton.icon(
            onPressed: () {},
            label: Text(
              'Verify',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            icon: Icon(
              FontAwesomeIcons.questionCircle,
              color: Colors.red,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
