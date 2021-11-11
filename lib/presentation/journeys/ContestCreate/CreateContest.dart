import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/presentation/journeys/ContestCreate/prize_breakup.dart';
import 'package:coddr/presentation/journeys/curated_contests/platform_label.dart';
import 'package:flutter/material.dart';

class CreateContest extends StatefulWidget {
  final bool isPrivate;
  final int parentContestId;
  final String platformId;
  final UserModel userModel;
  final String contestId;
  final DateTime startTime;
  final DateTime endtime;
  final String title;

  CreateContest({
    @required this.isPrivate,
    @required this.parentContestId,
    @required this.platformId,
    @required this.userModel,
    @required this.contestId,
    @required this.startTime,
    @required this.endtime,
    @required this.title,
  });
  @override
  _CreateContestState createState() => _CreateContestState();
}

class _CreateContestState extends State<CreateContest> {
  GlobalKey<FormState> _formKey = GlobalKey();
  static const int maxPrizePool = 10000;

  @override
  Widget build(BuildContext context) {
    final String contestTypeText = widget.isPrivate ? 'Private' : "Public";
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController contestsizecontroller = TextEditingController();
    TextEditingController entryfeescontroller = TextEditingController();
    TextEditingController contestNameController = TextEditingController();

    int getPoolPrize() {
      if (contestsizecontroller.text.isEmpty ||
          entryfeescontroller.text.isEmpty) return 0;
      int value = (int.parse(contestsizecontroller.text) *
          int.parse(entryfeescontroller.text));
      return value;
    }

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
                  "Type : $contestTypeText",
                  style: TextStyle(fontSize: Sizes.dimen_20.w),
                ),
              ],
            ),
            if (widget.isPrivate)
              SizedBox(
                height: Sizes.dimen_20.w,
              ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(Sizes.dimen_8.w),
                    child: TextFormField(
                      controller: contestNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Contest Name',
                        labelText: 'Contest Name',
                        contentPadding: EdgeInsets.fromLTRB(
                            Sizes.dimen_20.w,
                            Sizes.dimen_10.w,
                            Sizes.dimen_20.w,
                            Sizes.dimen_10.w),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Valid Contest Name';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                if (widget.isPrivate)
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(Sizes.dimen_8.w),
                      child: TextFormField(
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Password',
                          labelText: 'Password',
                          contentPadding: EdgeInsets.fromLTRB(
                              Sizes.dimen_20.w,
                              Sizes.dimen_10.w,
                              Sizes.dimen_20.w,
                              Sizes.dimen_10.w),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
              ],
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
                        contentPadding: EdgeInsets.fromLTRB(
                            Sizes.dimen_20.w,
                            Sizes.dimen_10.w,
                            Sizes.dimen_20.w,
                            Sizes.dimen_10.w),
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
                    padding: EdgeInsets.all(Sizes.dimen_8.w),
                    child: TextFormField(
                      controller: entryfeescontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Entry',
                        labelText: 'Entry Fees',
                        contentPadding: EdgeInsets.fromLTRB(
                            Sizes.dimen_20.w,
                            Sizes.dimen_10.w,
                            Sizes.dimen_20.w,
                            Sizes.dimen_10.w),
                        // fillColor: Colors.red
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Fees';
                        }

                        if (int.parse(value) > widget.userModel.coins) {
                          return 'Insufficent coins';
                        }
                        if (maxPrizePool < getPoolPrize())
                          return 'Pool prize exceeds max pool prize';
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            // Flexible(
            //   child: Padding(
            //     padding: EdgeInsets.all(Sizes.dimen_8.w),
            //     child: Text(
            //       'Pool Prize: ₹ ${getPoolPrize().toString()}',
            //       style: Theme.of(context).textTheme.bodyText1,
            //     ),
            //   ),
            // ),
            Divider(
              thickness: Sizes.dimen_2.w,
            ),
            Padding(
              padding: EdgeInsets.all(Sizes.dimen_8.w),
              child: Text(
                'Maximum Prize Pool',
                style: TextStyle(fontSize: Sizes.dimen_16.w),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(Sizes.dimen_8.w, 0, 0, 0),
              child: Text(
                '₹ $maxPrizePool',
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
                padding:
                    EdgeInsets.fromLTRB(Sizes.dimen_8.w, 0, Sizes.dimen_8.w, 0),
                child: Container(
                  width: double.infinity,
                  child: FlatButton(
                    child: Text('Prize Breakup',
                        style: TextStyle(fontSize: Sizes.dimen_24.w)),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PrizeBreakup(
                              contestName: contestNameController.text,
                              isPrivate: widget.isPrivate,
                              parentContestId: widget.parentContestId,
                              password: passwordcontroller.text,
                              platformId: widget.platformId,
                              prize: getPoolPrize(),
                              spots: int.parse(contestsizecontroller.text),
                              entryFees: int.parse(entryfeescontroller.text),
                              userModel: widget.userModel,
                              contestId: widget.contestId,
                              startTime: widget.startTime,
                              endtime: widget.endtime,
                              title: widget.title,
                            ),
                          ),
                        );
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
