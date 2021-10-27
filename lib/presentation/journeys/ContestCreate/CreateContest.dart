import 'package:coddr/presentation/journeys/ContestCreate/prize_breakup.dart';
import 'package:coddr/presentation/journeys/curated_contests/platform_label.dart';
import 'package:flutter/material.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';

class CreateContest extends StatefulWidget {
  @override
  _CreateContestState createState() => _CreateContestState();
}

class _CreateContestState extends State<CreateContest> {
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController contestsizecontroller = TextEditingController();
    TextEditingController entryfeescontroller = TextEditingController();
    return Scaffold(
        body: Form(
      key: _formKey,
      child: SafeArea(
        child: Column(
          children: [
            PlatformLabel(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Public',
                  style: TextStyle(fontSize: Sizes.dimen_20.w),
                ),
                SizedBox(
                  width: Sizes.dimen_40.w,
                ),
                Text(
                  'Private',
                  style: TextStyle(fontSize: Sizes.dimen_20.w),
                ),
              ],
            ),
            SizedBox(
              height: Sizes.dimen_20.w,
            ),
            Padding(
              padding:  EdgeInsets.fromLTRB(Sizes.dimen_90.w, 0, Sizes.dimen_90.w, 0),
              child: TextFormField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Password',
                  labelText: 'Password',
                  contentPadding: EdgeInsets.fromLTRB(Sizes.dimen_20.w, Sizes.dimen_10.w, Sizes.dimen_20.w, Sizes.dimen_10.w),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter Password';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: Sizes.dimen_20.w,
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(Sizes.dimen_8.w),
                    child: TextFormField(
                      controller: contestsizecontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Contest Size',
                        labelText: 'Contest Size',
                        contentPadding:
                            EdgeInsets.fromLTRB(Sizes.dimen_20.w, Sizes.dimen_10.w, Sizes.dimen_20.w, Sizes.dimen_10.w),
                        // fillColor: Colors.red
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Size';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding:  EdgeInsets.all(Sizes.dimen_8.w),
                    child: TextFormField(
                      controller: entryfeescontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Entry',
                        labelText: 'Entry Fees',
                        contentPadding:
                            EdgeInsets.fromLTRB(Sizes.dimen_20.w, Sizes.dimen_10.w, Sizes.dimen_20.w, Sizes.dimen_10.w),
                        // fillColor: Colors.red
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Fees';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: Sizes.dimen_2.w,
            ),
            Padding(
              padding:  EdgeInsets.all(Sizes.dimen_8.w),
              child: Text(
                'Maximum Prize Pool',
                style: TextStyle(fontSize: Sizes.dimen_16.w),
              ),
            ),
            Padding(
              padding:  EdgeInsets.fromLTRB(Sizes.dimen_8.w, 0, 0, 0),
              child: Text(
                '₹ 1000',
                style: TextStyle(fontSize: Sizes.dimen_20.w),
              ),
            ),
            Spacer(),
            Divider(
              thickness: Sizes.dimen_4.w,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:  EdgeInsets.fromLTRB(Sizes.dimen_8.w, 0, Sizes.dimen_8.w, 0),
                child: Container(
                  width: double.infinity,
                  child: FlatButton(
                    child:
                        Text('Prize Breakup', style: TextStyle(fontSize: Sizes.dimen_24.w)),
                    onPressed: () {
                      if(_formKey.currentState.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PrizeBreakup()));
                      }
                    },
                    color: Colors.green,
                    textColor: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
