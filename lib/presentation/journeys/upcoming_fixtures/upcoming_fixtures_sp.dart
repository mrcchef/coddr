import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/presentation/journeys/upcoming_fixtures/FixturesList.dart';
import 'package:coddr/presentation/journeys/upcoming_fixtures/platformlabel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coddr/common/extensions/size_extensions.dart';


class UpcomingFixtures extends StatefulWidget {
  @override
  _UpcomingFixturesState createState() => _UpcomingFixturesState();
}

class _UpcomingFixturesState extends State<UpcomingFixtures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          PlatformLabel(),
          Padding(
            padding:  EdgeInsets.all(Sizes.dimen_8.w),
            child: Text(
              'Public Contest',
              style: TextStyle(fontSize: Sizes.dimen_22.w, fontWeight: FontWeight.w600),
            ),
          ),
         FixturesList(),
          Padding(
            padding:  EdgeInsets.all(Sizes.dimen_8.w),
            child: Row(
              children: [
                Text(
                  'Private Contest',
                  style: TextStyle(fontSize: Sizes.dimen_22.w, fontWeight: FontWeight.w600),
                ),
                Spacer(),
                RaisedButton(
                  onPressed: () {},
                    color: Colors.red[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Sizes.dimen_20.w)
                    ),
                  child:Text('Create Contest',style: TextStyle(color: Colors.white),)
                )
              ],
            ),
          ),
          FixturesList(),
        ],
      ),
    );
  }
}
