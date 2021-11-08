import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/presentation/blocs/update_curated_contest/update_curated_contest_bloc.dart';
import 'package:coddr/presentation/journeys/RankList/RankListPage.dart';
import 'package:coddr/presentation/journeys/curated_contests/platform_label.dart';
import 'package:coddr/presentation/journeys/upcoming_contests/upcoming_contests_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmParticipation extends StatelessWidget {
  static const routeName = '/confirm_participation';
  final UserModel userModel;
  final CuratedContestModel curatedContestModel;
  final DateTime startTime;
  final DateTime endTime;
  final String title;

  ConfirmParticipation({
    @required this.userModel,
    @required this.curatedContestModel,
    @required this.startTime,
    @required this.endTime,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    CuratedContestModel newCuratedContestModel;
    UserModel newUserModel;

    return Scaffold(
      body: BlocListener<UpdateCuratedContestBloc, UpdateCuratedContestState>(
        listener: (context, state) {
          if (state is CuratedContestErrorState) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Contest Participation Failed!!"),
                backgroundColor: Colors.red,
              ),
            );
            Navigator.popAndPushNamed(
                context, UpcomingContestsScreen.routeName);
          } else if (state is CuratedContestUpdatedState) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Contest Participation Success!!"),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RankListPage(
                    curatedContestModel: newCuratedContestModel,
                    startTime: startTime,
                    endTime: endTime,
                    title: title),
              ),
            );
          }
        },
        child: SafeArea(
          child: Column(
            children: [
              PlatformLabel(),
              Text(
                "Confirm Participation",
                style: Theme.of(context).textTheme.headline5,
              ),
              Spacer(),
              Divider(
                thickness: Sizes.dimen_4.w,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      Sizes.dimen_8.w, 0, Sizes.dimen_8.w, 0),
                  child: Container(
                    width: double.infinity,
                    child: BlocBuilder<UpdateCuratedContestBloc,
                        UpdateCuratedContestState>(
                      builder: (context, state) {
                        Widget childWidget = Text('Confirm',
                            style: TextStyle(fontSize: Sizes.dimen_24.w));

                        void Function() onPressed = () {
                          Map<String, String> hm = {
                            'displayName': userModel.displayName,
                            'uid': userModel.uid,
                            'email': userModel.email
                          };
                          List<Map<String, String>> participants =
                              curatedContestModel.participants;
                          participants.add(hm);

                          newUserModel = userModel.copyWith(
                            coins:
                                userModel.coins - curatedContestModel.entryFees,
                            contest: userModel.contest + 1,
                          );

                          print("newUserModel $newUserModel");

                          newCuratedContestModel = curatedContestModel.copyWith(
                            filledSpots: curatedContestModel.filledSpots + 1,
                            participants: participants,
                          );

                          BlocProvider.of<UpdateCuratedContestBloc>(context)
                              .add(
                            UpdateCuratedContestEventt(
                              curatedContestModel: newCuratedContestModel,
                              userModel: newUserModel,
                            ),
                          );
                        };

                        if (state is CuratedContestUpdatingState) {
                          childWidget = CircularProgressIndicator();
                          onPressed = null;
                        }

                        return FlatButton(
                          child: childWidget,
                          onPressed: onPressed,
                          color: Colors.green,
                          textColor: Colors.white,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
