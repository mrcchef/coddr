import 'package:flutter/material.dart';

class TeamCard extends StatelessWidget {
  //final String id;
  final String fName;
  final String lName;
  final String image;

  TeamCard({this.image, this.fName, this.lName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 8,
        margin: EdgeInsets.all(1),
        child: Column(children: [
          //   SizedBox(height: 10),
          Container(
            margin: EdgeInsets.all(5),
            height: 175,
            width: 150,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(image, fit: BoxFit.cover)),
          ),
          // SizedBox(height: 10),
          Text(
            fName,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            lName,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
          
        ]),
      ),
    );
  }
}
