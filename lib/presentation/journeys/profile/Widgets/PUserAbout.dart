import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class PUserAbout extends StatelessWidget {
  const PUserAbout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
            decoration: BoxDecoration(
                color: HexColor('FDE5D9'),
                borderRadius: BorderRadius.circular(30)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Student/Professional',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('Student'),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 20, 10, 10),
                      child: Icon(FontAwesomeIcons.laptop),
                    ),
                    SizedBox(
                      width: 30,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 5),
                  child: Text('Institution',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 5),
                  child: Text(
                      'Indian Institute of Information Technology Vadodara'),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            )));
  }
}
