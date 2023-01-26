import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/enums/enum_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/presentation/themes/themes.dart';
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

  @override
  void initState() {
    super.initState();

    if (widget.contestState != ContestState.notStarted) {
      widget.curatedContestModel.participants.forEach((element) {
        users.add(element['handelCF']);
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

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                return ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Sizes.dimen_16.w,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Participants: ${participatedUsers.length}',
                            style: ThemeText.bodyText1,
                          ),
                          Spacer(),
                          Text(
                            'Eligible: ${nonParticipatedUsers.length}',
                            style: ThemeText.bodyText1,
                          )
                        ],
                      ),
                    ),
                    ListView.builder(itemBuilder: ((context, index) {
                      return ListTile();
                    })),
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
