import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/domain/entities/fetch_curated_contest_argument.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/presentation/blocs/create_curated_contest/create_curated_contest_bloc.dart';
import 'package:coddr/presentation/blocs/curated_contest/curated_contest_bloc.dart';
import 'package:coddr/presentation/blocs/profile/profile_bloc.dart';
import 'package:coddr/presentation/journeys/ContestCreate/CreateContest.dart';
import 'package:coddr/presentation/journeys/curated_contests/curated_contest_list.dart';
import 'package:coddr/presentation/journeys/curated_contests/platform_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CuratedContests extends StatefulWidget {
  static const String routeName = "/curated-contests";
  final int constestId;
  final String platformId;
  final DateTime startTime;
  final DateTime endtime;
  final String title;

  const CuratedContests({
    Key key,
    @required this.constestId,
    @required this.platformId,
    @required this.startTime,
    @required this.endtime,
    @required this.title,
  }) : super(key: key);

  @override
  _CuratedContestsState createState() => _CuratedContestsState();
}

class _CuratedContestsState extends State<CuratedContests> {
  CuratedContestBloc _curatedContestBloc;
  CreateCuratedContestBloc _createCuratedContestBloc;
  ProfileBloc _profileBloc;

  @override
  void initState() {
    _curatedContestBloc = getItInstance<CuratedContestBloc>();
    _profileBloc = getItInstance<ProfileBloc>();
    _curatedContestBloc.add(
      FetchCuratedContestEvent(
        fetchCuratedContestArgument: FetchCuratedContestArgument(
          contestId: widget.constestId,
          platfromId: widget.platformId,
        ),
      ),
    );
    _profileBloc.add(FetchProfileData());
    _createCuratedContestBloc = getItInstance<CreateCuratedContestBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _curatedContestBloc.close();
    _createCuratedContestBloc.close();
    _profileBloc.close();
    super.dispose();
  }

  Future<void> _getData() async {
    _curatedContestBloc.add(
      FetchCuratedContestEvent(
        fetchCuratedContestArgument: FetchCuratedContestArgument(
          contestId: widget.constestId,
          platfromId: widget.platformId,
        ),
      ),
    );
    _profileBloc.add(FetchProfileData());
  }

  @override
  Widget build(BuildContext context) {
    UserModel userModel;
    List<CuratedContestModel> curatedContestList;
    List<CuratedContestModel> publicContest = [], privateContest = [];

    String getNextContestId(String type, int len) {
      String id = widget.constestId.toString() + type + len.toString();
      return id;
    }

    return RefreshIndicator(
      onRefresh: _getData,
      child: BlocBuilder<CuratedContestBloc, CuratedContestState>(
        bloc: _curatedContestBloc,
        builder: (context, state) {
          if (state is CuratedContestFetchingState)
            return Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              ),
            );

          if (state is CuratedContestErrorState)
            return Center(
              child: Text(
                state.message,
                style: Theme.of(context).textTheme.headline2,
              ),
            );

          if (state is CuratedContestFetchedState) {
            curatedContestList = state.curatedContestList;
            privateContest.clear();
            publicContest.clear();
            curatedContestList.forEach((element) {
              if (element.isPrivate)
                privateContest.add(element);
              else
                publicContest.add(element);
            });
          }

          return BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context, state) {
              if (state is ProfileError) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Falied to load!!, Please refresh'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            bloc: _profileBloc,
            builder: (context, state) {
              if (state is ProfileLoding)
                return Container(
                  color: Colors.white,
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  ),
                );

              if (state is ProfileError) {
                return Center(
                  child: Text(
                    "Falied to load!!, Please refresh",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                );
              }

              final curState = (state as ProfileLoaded);
              userModel = curState.userModel;

              return Scaffold(
                body: ListView(
                  children: [
                    PlatformLabel(),
                    Padding(
                      padding: EdgeInsets.all(Sizes.dimen_8.w),
                      child: Row(
                        children: [
                          Text(
                            'Public Contest',
                            style: TextStyle(
                                fontSize: Sizes.dimen_22.w,
                                fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          if (userModel.isAdmin)
                            RaisedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CreateContest(
                                      isPrivate: false,
                                      parentContestId: widget.constestId,
                                      platformId: widget.platformId,
                                      userModel: userModel,
                                      contestId: getNextContestId(
                                          "PBL", publicContest.length + 1),
                                      startTime: widget.startTime,
                                      endtime: widget.endtime,
                                      title: widget.title,
                                    ),
                                  ),
                                );
                              },
                              color: Colors.red[900],
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(Sizes.dimen_20.w)),
                              child: Text(
                                'Create Contest',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                        ],
                      ),
                    ),
                    CuratedContestList(
                      curatedContest: publicContest,
                      isPrivate: false,
                      userModel: userModel,
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
                              onPressed: () {
                                //print(privateContest.length);
                                if (!userModel.isHandelCFVerified)
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Codeforces Handle is not verfied!!"),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                else {
                                  Navigator.of(context).pop();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CreateContest(
                                        isPrivate: true,
                                        parentContestId: widget.constestId,
                                        platformId: widget.platformId,
                                        userModel: userModel,
                                        contestId: getNextContestId(
                                            "PVT", privateContest.length + 1),
                                        startTime: widget.startTime,
                                        endtime: widget.endtime,
                                        title: widget.title,
                                      ),
                                    ),
                                  );
                                }
                              },
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
                      isPrivate: true,
                      userModel: userModel,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
