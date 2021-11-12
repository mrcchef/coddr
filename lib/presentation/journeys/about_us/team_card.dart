import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
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
          Container(
            margin: EdgeInsets.all(5),
            height: Sizes.dimen_200.w,
            width: Sizes.dimen_150.w,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(image, fit: BoxFit.cover)),
          ),
          Text(
            fName,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            lName,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ]),
      ),
    );
  }
}
