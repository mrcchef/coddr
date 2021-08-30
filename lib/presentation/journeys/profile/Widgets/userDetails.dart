import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
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
            "Sahil Potdukhe",
            style: TextStyle(fontSize: 12, color: Colors.black),
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
            "7447332096",
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
                color: HexColor('0B2FB0')),
          ),
          subtitle: Text(
            "sahilpotdukhe@gmail.com",
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
          leading: CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage('assets/images/img_1.png'),
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
    );
  }
}
