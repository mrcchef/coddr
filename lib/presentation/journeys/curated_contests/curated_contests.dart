import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/domain/entities/fetch_curated_contest_argument.dart';
import 'package:coddr/presentation/blocs/create_curated_contest/create_curated_contest_bloc.dart';
import 'package:coddr/presentation/blocs/curated_contest/curated_contest_bloc.dart';
import 'package:coddr/presentation/journeys/curated_contests/curated_contest_list.dart';
import 'package:coddr/presentation/journeys/curated_contests/platform_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CuratedContests extends StatefulWidget {
  static const String routeName = "/curated-contests";

  @override
  _CuratedContestsState createState() => _CuratedContestsState();
}

class _CuratedContestsState extends State<CuratedContests> {
  CuratedContestBloc _curatedContestBloc;
  CreateCuratedContestBloc _createCuratedContestBloc;

  @override
  void initState() {
    _curatedContestBloc = getItInstance<CuratedContestBloc>();
    Map<String, dynamic> input = ModalRoute.of(context).settings.arguments;
    _curatedContestBloc.add(
      FetchCuratedContestEvent(
        fetchCuratedContestArgument: FetchCuratedContestArgument(
          contestId: input['constedId'],
          platfromId: input['platformId'],
        ),
      ),
    );
    _createCuratedContestBloc = getItInstance<CreateCuratedContestBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _curatedContestBloc.close();
    _createCuratedContestBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CuratedContestBloc, CuratedContestState>(
      bloc: _curatedContestBloc,
      builder: (context, state) {
        if (state is CuratedContestFetchingState)
          return Center(
            child: CircularProgressIndicator(),
          );

        if (state is CuratedContestErrorState)
          return Center(
            child: Text(
              state.message,
              style: Theme.of(context).textTheme.headline2,
            ),
          );
        List<CuratedContestModel> publicContest, privateContest;

        if (state is CuratedContestFetchedState) {
          List<CuratedContestModel> curatedContestList =
              state.curatedContestList;
          curatedContestList.forEach((element) {
            if (element.isPrivate)
              privateContest.add(element);
            else
              publicContest.add(element);
          });
        }

        return Scaffold(
          body: ListView(
            children: [
              PlatformLabel(),
              Padding(
                padding: EdgeInsets.all(Sizes.dimen_8.w),
                child: Text(
                  'Public Contest',
                  style: TextStyle(
                      fontSize: Sizes.dimen_22.w, fontWeight: FontWeight.w600),
                ),
              ),
              CuratedContestList(
                curatedContest: publicContest,
              ),
              Padding(
                padding: EdgeInsets.all(Sizes.dimen_8.w),
                child: Row(
                  children: [
                    Text(
                      'Private Contest',
                      style: TextStyle(
                          fontSize: Sizes.dimen_22.w,
                          fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    RaisedButton(
                        onPressed: () {},
                        color: Colors.red[900],
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Sizes.dimen_20.w)),
                        child: Text(
                          'Create Contest',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
              CuratedContestList(
                curatedContest: privateContest,
              ),
            ],
          ),
        );
      },
    );
  }
}
