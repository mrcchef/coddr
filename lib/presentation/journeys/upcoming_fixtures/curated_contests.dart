import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/presentation/journeys/upcoming_fixtures/curated_contest_list.dart';
import 'package:coddr/presentation/journeys/upcoming_fixtures/platformlabel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coddr/common/extensions/size_extensions.dart';


class CuratedContests extends StatefulWidget {
  @override
  _CuratedContestsState createState() => _CuratedContestsState();
}

class _CuratedContestsState extends State<CuratedContests> {
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
         CuratedContestList(),
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
          CuratedContestList(),
        ],
      ),
    );
  }
}
