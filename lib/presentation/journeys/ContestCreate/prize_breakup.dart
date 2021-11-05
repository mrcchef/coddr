import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/presentation/blocs/create_curated_contest/create_curated_contest_bloc.dart';
import 'package:coddr/presentation/journeys/curated_contests/curated_contests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrizeBreakup extends StatelessWidget {
  final String contestName;
  final String password;
  final bool isPrivate;
  final int spots;
  final int entryFees;
  final int prize;
  final int parentContestId;
  final String platformId;
  final UserModel userModel;
  final String contestId;
  final DateTime startTime;
  final DateTime endtime;
  final String title;

  const PrizeBreakup({
    Key key,
    @required this.spots,
    @required this.entryFees,
    @required this.contestName,
    @required this.password,
    @required this.isPrivate,
    @required this.prize,
    @required this.parentContestId,
    @required this.platformId,
    @required this.userModel,
    @required this.contestId,
    @required this.startTime,
    @required this.endtime,
    @required this.title,
  }) : super(key: key);

  int getPrize(int percent, int prize) {
    double value = (prize * percent) / 100;
    return value.toInt();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, int> positionToReward = {
      '1': getPrize(50, prize),
      '2': getPrize(30, prize),
      '3': getPrize(20, prize),
    };

    Map<String, String> positionToUsername = {'1': '', '2': '', '3': ''};
    List<Map<String, String>> participants = [];
    Map<String, String> host = {
      'displayName': userModel.displayName,
      'uid': userModel.uid,
      'email': userModel.email
    };
    participants.add(host);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Prize Breakup',
          style: TextStyle(
              fontSize: Sizes.dimen_16.w, fontWeight: FontWeight.w200),
        ),
        backgroundColor: Colors.black,
        toolbarHeight: Sizes.dimen_46.w,
      ),
      body: BlocListener<CreateCuratedContestBloc, CreateCuratedContestState>(
        bloc: BlocProvider.of<CreateCuratedContestBloc>(context),
        listener: (context, state) {
          if (state is CreateCuratedContestFailedState)
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Failed: Contest did not created'),
                backgroundColor: Colors.red,
              ),
            );

          if (state is CreateCuratedContestSuccessState)
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Success: Contest Successfully created'),
                backgroundColor: Colors.green,
              ),
            );

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CuratedContests(
                constestId: parentContestId,
                platformId: platformId,
                userModel: userModel,
                startTime: startTime,
                endtime: endtime,
                title: title,
              ),
            ),
          );
        },
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          Sizes.dimen_8.w, Sizes.dimen_4.w, Sizes.dimen_8.w, 0),
                      child: Text(
                        'Prize Pool',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Text(
                      prize.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          Sizes.dimen_8.w, Sizes.dimen_4.w, Sizes.dimen_8.w, 0),
                      child: Text(
                        'Spots',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Text(
                      spots.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: Sizes.dimen_18.w),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(Sizes.dimen_8.w,
                            Sizes.dimen_4.w, Sizes.dimen_8.w, 0),
                        child: Text(
                          'Entry',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Text(
                        entryFees.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Sizes.dimen_20.w,
            ),
            Padding(
              padding: EdgeInsets.all(Sizes.dimen_18.w),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Sizes.dimen_20.w),
                    border: Border.all(color: Colors.black)),
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          Sizes.dimen_8.w, Sizes.dimen_6.w, Sizes.dimen_8.w, 0),
                      child: Row(
                        children: [
                          Text('Rank'),
                          Spacer(),
                          Text('% of Prize Pool'),
                          Spacer(),
                          Text('Winnings')
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          Sizes.dimen_8.w, 0, Sizes.dimen_8.w, 0),
                      child: Row(
                        children: [
                          Text('#1'),
                          Spacer(),
                          Text('50%'),
                          Spacer(),
                          Text(getPrize(50, prize).toString()),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          Sizes.dimen_8.w, 0, Sizes.dimen_8.w, 0),
                      child: Row(
                        children: [
                          Text('#2'),
                          Spacer(),
                          Text('30%'),
                          Spacer(),
                          Text(getPrize(30, prize).toString()),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          Sizes.dimen_8.w, 0, Sizes.dimen_8.w, Sizes.dimen_4.w),
                      child: Row(
                        children: [
                          Text('#3'),
                          Spacer(),
                          Text('20%'),
                          Spacer(),
                          Text(getPrize(20, prize).toString()),
                        ],
                      ),
                    ),
                  ],
                ),
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
                    child: Text('Create Contest',
                        style: TextStyle(fontSize: Sizes.dimen_24.w)),
                    onPressed: () {
                      CuratedContestModel curatedContestModel =
                          CuratedContestModel(
                        contestId: contestId,
                        entryFees: entryFees,
                        prize: prize,
                        totalSpots: spots,
                        filledSpots: 1,
                        isPrivate: isPrivate,
                        password: password,
                        parentContestId: parentContestId.toString(),
                        platformId: platformId,
                        positionToReward: positionToReward,
                        positionToUsername: positionToUsername,
                        participants: participants,
                      );

                      BlocProvider.of<CreateCuratedContestBloc>(context).add(
                          CreateCuratedContestEventt(
                              curatedContestModel: curatedContestModel));
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
    );
  }
}
