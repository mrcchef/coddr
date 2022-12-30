import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/domain/entities/cf_handel_standings_entity.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/domain/entities/get_cf_standings_arguments.dart';
import 'package:coddr/presentation/blocs/contest_standings/contest_standings_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeaderBoard extends StatefulWidget {
  final CuratedContestModel curatedContestModel;

  LeaderBoard({@required this.curatedContestModel});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  List<String> users = [];
  ContestStandingsBloc _contestStandingsBloc;
  @override
  void initState() {
    super.initState();
    widget.curatedContestModel.participants.forEach((element) {
      users.add(element['handelCF']);
    });
    print(widget.curatedContestModel.contestId);

    print("Users ---> " + users.toString());
    _contestStandingsBloc = getItInstance<ContestStandingsBloc>();
    _contestStandingsBloc.add(CFStandingsListing(
        getCFStandingsArguments: GetCFStandingsArguments(
      handles: users,
      contestId: widget.curatedContestModel.parentContestId,
    )));
  }

  List<CFHandelStandingsEntity> sortUsers(List<CFHandelStandingsEntity> users) {
    users.sort((a, b) => (a.rank > b.rank) == true ? 1 : 0);
    return users;
  }

  @override
  void dispose() {
    _contestStandingsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocBuilder<ContestStandingsBloc, ContestStandingsState>(
          bloc: _contestStandingsBloc,
          builder: (context, state) {
            if (state is ContestStandingsFetching)
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                  backgroundColor: Colors.green,
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
              return Table(
                border: TableBorder.all(),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: <int, TableColumnWidth>{
                  0: FixedColumnWidth(Sizes.dimen_40.w),
                  1: FlexColumnWidth(),
                  2: FixedColumnWidth(Sizes.dimen_50.w),
                  3: FixedColumnWidth(Sizes.dimen_70.w),
                  4: FixedColumnWidth(Sizes.dimen_80.w)
                },
                children: [
                  TableRow(children: [
                    Center(
                      child: Text(
                        'Rank',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ),
                    Center(
                        child: Text(
                      'Userhandle',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    )),
                    Center(
                        child: Text(
                      'Points',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    )),
                    Center(
                        child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          Sizes.dimen_7.w, 0, Sizes.dimen_7.w, 0),
                      child: Text('Contest rank',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red)),
                    )),
                    Center(
                        child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          Sizes.dimen_7.w, 0, Sizes.dimen_7.w, 0),
                      child: Text('Penalty',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red)),
                    )),
                  ]),
                  TableRow(
                    children: [
                      ListView.builder(
                          itemCount: sortedParticipatedUsers.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) {
                            return Center(child: Text((index + 1).toString()));
                          }),
                      ListView.builder(
                          itemCount: sortedParticipatedUsers.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) {
                            return Center(
                                child: Text(
                                    sortedParticipatedUsers[index].handle));
                          }),
                      ListView.builder(
                          itemCount: sortedParticipatedUsers.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) {
                            return Center(
                                child: Text(sortedParticipatedUsers[index]
                                    .points
                                    .toString()));
                          }),
                      ListView.builder(
                          itemCount: sortedParticipatedUsers.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) {
                            return Center(
                                child: Text(sortedParticipatedUsers[index]
                                    .rank
                                    .toString()));
                          }),
                      ListView.builder(
                          itemCount: sortedParticipatedUsers.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) {
                            return Center(
                                child: Text(sortedParticipatedUsers[index]
                                    .penalty
                                    .toString()));
                          }),
                    ],
                  ),
                  TableRow(
                    children: [
                      ListView.builder(
                          itemCount: nonParticipatedUsers.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) {
                            return Center(
                                child: Text(
                                    (participatedUsers.length + index + 1)
                                        .toString()));
                          }),
                      ListView.builder(
                          itemCount: nonParticipatedUsers.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) {
                            return Center(
                                child:
                                    Text(nonParticipatedUsers[index].handle));
                          }),
                      ListView.builder(
                          itemCount: nonParticipatedUsers.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) {
                            return Center(
                                child: Text(nonParticipatedUsers[index]
                                    .points
                                    .toString()));
                          }),
                      ListView.builder(
                          itemCount: nonParticipatedUsers.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) {
                            return Center(
                                child: Text(nonParticipatedUsers[index]
                                    .rank
                                    .toString()));
                          }),
                      ListView.builder(
                          itemCount: nonParticipatedUsers.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) {
                            return Center(
                                child: Text(nonParticipatedUsers[index]
                                    .penalty
                                    .toString()));
                          }),
                    ],
                  ),
                ],
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
