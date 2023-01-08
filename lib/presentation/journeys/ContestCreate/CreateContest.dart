import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/presentation/journeys/ContestCreate/prize_breakup.dart';
import 'package:coddr/presentation/journeys/curated_contests/platform_label.dart';
import 'package:flutter/material.dart';

import '../../themes/app_color.dart';
import '../../themes/themes.dart';

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
  String contestTypeText;
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController contestsizecontroller = TextEditingController();
  TextEditingController entryfeescontroller = TextEditingController();
  TextEditingController contestNameController = TextEditingController();
  int poolPrize = 0;
  void initState() {
    contestTypeText = widget.isPrivate ? 'Private' : "Public";
    entryfeescontroller.addListener(() {
      if (contestsizecontroller.text.isEmpty ||
          entryfeescontroller.text.isEmpty) return 0;
      poolPrize = (int.parse(contestsizecontroller.text) *
          int.parse(entryfeescontroller.text));

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PlatformLabel(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Contest Type: ",
                        style: ThemeText.headline6,
                      ),
                      Text(
                        contestTypeText,
                        style: ThemeText.headline6.copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(Sizes.dimen_4.h),
                        child: TextFormField(
                          autocorrect: true,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            hintText: 'Contest Name',
                            labelText: 'Contest Name',
                            labelStyle: TextStyle(color: Colors.brown[200]),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Sizes.dimen_4.w,
                                  color: AppColor.lightYellow),
                              borderRadius:
                                  BorderRadius.circular(Sizes.dimen_10.w),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Sizes.dimen_4.w,
                                  color: AppColor.lightYellow),
                              borderRadius:
                                  BorderRadius.circular(Sizes.dimen_10.w),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Sizes.dimen_4.w,
                                  color: AppColor.lightRed),
                              borderRadius:
                                  BorderRadius.circular(Sizes.dimen_10.w),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Sizes.dimen_4.w,
                                  color: AppColor.lightRed),
                              borderRadius:
                                  BorderRadius.circular(Sizes.dimen_10.w),
                            ),
                            contentPadding: EdgeInsets.all(Sizes.dimen_16.w),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            fillColor: Colors.white70,
                          ),
                          controller: contestNameController,
                          style:
                              ThemeText.bodyText1.copyWith(color: Colors.brown),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Contest Name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    if (widget.isPrivate)
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.all(Sizes.dimen_4.h),
                          child: TextFormField(
                            autocorrect: true,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              hintText: 'xxxxx',
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.brown[200]),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: Sizes.dimen_4.w,
                                    color: AppColor.lightYellow),
                                borderRadius:
                                    BorderRadius.circular(Sizes.dimen_10.w),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: Sizes.dimen_4.w,
                                    color: AppColor.lightYellow),
                                borderRadius:
                                    BorderRadius.circular(Sizes.dimen_10.w),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: Sizes.dimen_4.w,
                                    color: AppColor.lightRed),
                                borderRadius:
                                    BorderRadius.circular(Sizes.dimen_10.w),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: Sizes.dimen_4.w,
                                    color: AppColor.lightRed),
                                borderRadius:
                                    BorderRadius.circular(Sizes.dimen_10.w),
                              ),
                              contentPadding: EdgeInsets.all(Sizes.dimen_16.w),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[500]),
                              fillColor: Colors.white70,
                            ),
                            controller: passwordcontroller,
                            style: ThemeText.bodyText1
                                .copyWith(color: Colors.brown),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter password';
                              }
                              if (value.length < 5)
                                return 'Length is less than 5';
                              return null;
                            },
                          ),
                        ),
                      ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(Sizes.dimen_4.h),
                        child: TextFormField(
                          autocorrect: true,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            hintText: '5',
                            labelText: 'Contest Size',
                            labelStyle: TextStyle(color: Colors.brown[200]),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Sizes.dimen_4.w,
                                  color: AppColor.lightYellow),
                              borderRadius:
                                  BorderRadius.circular(Sizes.dimen_10.w),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Sizes.dimen_4.w,
                                  color: AppColor.lightYellow),
                              borderRadius:
                                  BorderRadius.circular(Sizes.dimen_10.w),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Sizes.dimen_4.w,
                                  color: AppColor.lightRed),
                              borderRadius:
                                  BorderRadius.circular(Sizes.dimen_10.w),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Sizes.dimen_4.w,
                                  color: AppColor.lightRed),
                              borderRadius:
                                  BorderRadius.circular(Sizes.dimen_10.w),
                            ),
                            contentPadding: EdgeInsets.all(Sizes.dimen_16.w),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            fillColor: Colors.white70,
                          ),
                          controller: contestsizecontroller,
                          keyboardType: TextInputType.number,
                          style:
                              ThemeText.bodyText1.copyWith(color: Colors.brown),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Size';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(Sizes.dimen_4.h),
                        child: TextFormField(
                          autocorrect: true,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            hintText: '20',
                            labelText: 'Entry Fees',
                            labelStyle: TextStyle(color: Colors.brown[200]),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Sizes.dimen_4.w,
                                  color: AppColor.lightYellow),
                              borderRadius:
                                  BorderRadius.circular(Sizes.dimen_10.w),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Sizes.dimen_4.w,
                                  color: AppColor.lightYellow),
                              borderRadius:
                                  BorderRadius.circular(Sizes.dimen_10.w),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Sizes.dimen_4.w,
                                  color: AppColor.lightRed),
                              borderRadius:
                                  BorderRadius.circular(Sizes.dimen_10.w),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Sizes.dimen_4.w,
                                  color: AppColor.lightRed),
                              borderRadius:
                                  BorderRadius.circular(Sizes.dimen_10.w),
                            ),
                            contentPadding: EdgeInsets.all(Sizes.dimen_16.w),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            fillColor: Colors.white70,
                          ),
                          controller: entryfeescontroller,
                          keyboardType: TextInputType.number,
                          style:
                              ThemeText.bodyText1.copyWith(color: Colors.brown),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Entry Fees';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(Sizes.dimen_8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pool Prize: ',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        '₹ $poolPrize',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: Sizes.dimen_2.w,
                ),
                Padding(
                  padding: EdgeInsets.all(Sizes.dimen_8.w),
                  child: Text(
                    'Maximum Prize Pool',
                    style: ThemeText.headline6,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(Sizes.dimen_8.w, 0, 0, 0),
                  child: Text(
                    '₹ $maxPrizePool',
                    style: ThemeText.headline6.copyWith(color: Colors.red),
                  ),
                ),
                Spacer(),
                Divider(
                  thickness: Sizes.dimen_4.w,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_10.w,
                        vertical: Sizes.dimen_2.h),
                    child: Container(
                      width: double.infinity,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white),
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
                                  prize: poolPrize,
                                  spots: int.parse(contestsizecontroller.text),
                                  entryFees:
                                      int.parse(entryfeescontroller.text),
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
