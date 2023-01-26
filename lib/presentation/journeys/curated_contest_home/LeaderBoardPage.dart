import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/enums/enum_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/presentation/themes/app_color.dart';
import 'package:coddr/presentation/themes/themes.dart';
import 'package:coddr/presentation/widgets/Loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../dependencies/get_it.dart';
import '../../../domain/entities/cf_handel_standings_entity.dart';
import '../../../domain/entities/curated_contest_model.dart';
import '../../../domain/entities/get_cf_standings_arguments.dart';
import '../../blocs/contest_standings/contest_standings_bloc.dart';

class LeaderBoardPage extends StatefulWidget {
  final CuratedContestModel curatedContestModel;
  final ContestState contestState;

  LeaderBoardPage({
    @required this.curatedContestModel,
    @required this.contestState,
  });
  @override
  State<LeaderBoardPage> createState() => _LeaderBoardPageState();
}

class _LeaderBoardPageState extends State<LeaderBoardPage> {
  List<String> users = [];
  ContestStandingsBloc _contestStandingsBloc;
  Map<String, String> userToImage = new Map();

  @override
  void initState() {
    super.initState();

    if (widget.contestState != ContestState.notStarted) {
      widget.curatedContestModel.participants.forEach((element) {
        users.add(element['handelCF']);
        userToImage[element['handelCF']] = element['imageUrl'];
      });

      _contestStandingsBloc = getItInstance<ContestStandingsBloc>();
      _contestStandingsBloc.add(CFStandingsListing(
          getCFStandingsArguments: GetCFStandingsArguments(
        handles: users,
        contestId: widget.curatedContestModel.parentContestId,
      )));
    }
  }

  List<CFHandelStandingsEntity> sortUsers(List<CFHandelStandingsEntity> users) {
    users.sort((a, b) => (a.rank > b.rank) == true ? 1 : 0);
    return users;
  }

  @override
  void dispose() {
    _contestStandingsBloc?.close();
    super.dispose();
  }

  final List<Color> cardColors = [
    AppColor.lightGreen,
    AppColor.lightRed,
    AppColor.lightViolet,
    AppColor.lightBrown,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.contestState == ContestState.notStarted)
          Container(
            padding: EdgeInsets.symmetric(
              vertical: Sizes.dimen_12.w,
              horizontal: Sizes.dimen_14.w,
            ),
            child: Center(
              child: Text(
                "Contest Not Started",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: Sizes.dimen_16.w),
              ),
            ),
          ),
        if (widget.contestState != ContestState.notStarted)
          BlocBuilder<ContestStandingsBloc, ContestStandingsState>(
            bloc: _contestStandingsBloc,
            builder: (context, state) {
              if (state is ContestStandingsFetching)
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                      backgroundColor: Colors.green,
                    ),
                  ),
                );
              else if (state is ContestStandingsFetched) {
                List<CFHandelStandingsEntity> participatedUsers = [];
                List<CFHandelStandingsEntity> nonParticipatedUsers = [];

                state.cfStandings.cfHandelStandingsEntity.forEach((element) {
                  if (element.rank == -1)
                    nonParticipatedUsers.add(element);
                  else
                    participatedUsers.add(element);
                });

                List<CFHandelStandingsEntity> sortedParticipatedUsers =
                    sortUsers(participatedUsers);
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: Sizes.dimen_16.w,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Participants: ${participatedUsers.length + nonParticipatedUsers.length}',
                                style: ThemeText.bodyText1
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                'Eligible: ${nonParticipatedUsers.length}',
                                style: ThemeText.bodyText1
                                    .copyWith(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        ListView.separated(
                          separatorBuilder: ((context, index) {
                            return SizedBox(
                              height: Sizes.dimen_16.w,
                            );
                          }),
                          shrinkWrap: true,
                          itemCount: sortedParticipatedUsers.length,
                          itemBuilder: ((context, index) {
                            return ListTile(
                                minVerticalPadding: Sizes.dimen_10.w,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Sizes.dimen_20.w)),
                                tileColor:
                                    cardColors[index % cardColors.length],
                                title: Text(
                                  sortedParticipatedUsers[index].handle,
                                  maxLines: 1,
                                  style: ThemeText.bodyText1
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Solved: ${sortedParticipatedUsers[index].solvedProblems}',
                                      maxLines: 1,
                                      style: ThemeText.subtitle2,
                                    ),
                                    Text(
                                      'Score: ${sortedParticipatedUsers[index].points}',
                                      maxLines: 1,
                                      style: ThemeText.subtitle2,
                                    ),
                                  ],
                                ),
                                leading: Stack(
                                  children: [
                                    Positioned.fill(
                                        child: Align(
                                      alignment: Alignment.center,
                                      child: Loading(),
                                    )),
                                    CircleAvatar(
                                      radius: Sizes.dimen_30.w,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: NetworkImage(userToImage[
                                          sortedParticipatedUsers[index]
                                              .handle]),
                                    ),
                                  ],
                                ),
                                trailing: Container(
                                  padding: EdgeInsets.all(Sizes.dimen_10.w),
                                  decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Sizes.dimen_10.w),
                                      color: Colors.white),
                                  child: Text(
                                    "${index + 1}",
                                    style: ThemeText.headline6,
                                  ),
                                ));
                          }),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: Sizes.dimen_16.w),
                          child: Text(
                            "Not Eligible",
                            style: ThemeText.headline6,
                          ),
                        ),
                        ListView.separated(
                          separatorBuilder: ((context, index) {
                            return SizedBox(
                              height: Sizes.dimen_16.w,
                            );
                          }),
                          shrinkWrap: true,
                          itemCount: nonParticipatedUsers.length,
                          itemBuilder: ((context, index) {
                            return ListTile(
                                minVerticalPadding: Sizes.dimen_10.w,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Sizes.dimen_20.w)),
                                tileColor: Colors.grey.shade200,
                                title: Text(
                                  nonParticipatedUsers[index].handle,
                                  maxLines: 1,
                                  style: ThemeText.bodyText1
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Solved: ${nonParticipatedUsers[index].solvedProblems}',
                                      maxLines: 1,
                                      style: ThemeText.subtitle2,
                                    ),
                                    Text(
                                      'Score: ${nonParticipatedUsers[index].points}',
                                      maxLines: 1,
                                      style: ThemeText.subtitle2,
                                    ),
                                  ],
                                ),
                                leading: Stack(
                                  children: [
                                    Positioned.fill(
                                        child: Align(
                                      alignment: Alignment.center,
                                      child: Loading(),
                                    )),
                                    CircleAvatar(
                                      radius: Sizes.dimen_30.w,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: NetworkImage(userToImage[
                                          sortedParticipatedUsers[index]
                                              .handle]),
                                    ),
                                  ],
                                ),
                                trailing: Container(
                                  padding: EdgeInsets.all(Sizes.dimen_10.w),
                                  decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Sizes.dimen_10.w),
                                      color: Colors.white),
                                  child: Text(
                                    "NA",
                                    style: ThemeText.headline6,
                                  ),
                                ));
                          }),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is ContestStandingsFailed) {
                return Center(
                  child: Text("Fetching Failed"),
                );
              }
              return SizedBox.shrink();
            },
          )
      ],
    );
  }
}
