import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/presentation/blocs/participated_contest/participated_contest_bloc.dart';
import 'package:coddr/presentation/journeys/participated_contest/participated_curated_contest_card.dart';
import 'package:coddr/presentation/journeys/participated_contest/PHistory.dart';
import 'package:coddr/presentation/widgets/CoddrAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParticipatedContestScreen extends StatefulWidget {
  final String uid;
  final int coins;
  final int contest;
  final int wins;
  const ParticipatedContestScreen({
    Key key,
    @required this.uid,
    @required this.coins,
    @required this.contest,
    @required this.wins,
  }) : super(key: key);

  @override
  _ParticipatedContestScreenState createState() =>
      _ParticipatedContestScreenState();
}

class _ParticipatedContestScreenState extends State<ParticipatedContestScreen> {
  ParticipatedContestBloc _participatedContestBloc;

  @override
  void initState() {
    _participatedContestBloc = getItInstance<ParticipatedContestBloc>();

    _participatedContestBloc
        .add(FetchParticipatedContestEvent(uid: widget.uid));

    super.initState();
  }

  @override
  void dispose() {
    _participatedContestBloc.close();
    super.dispose();
  }

  List<CuratedContestModel> sortContest(List<CuratedContestModel> users) {
    users.sort((a, b) => (a.startTime.isBefore(b.startTime)) == true ? 1 : 0);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    Widget leftAppBarWidget = InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Icon(Icons.arrow_back_ios, color: Colors.black),
    );

    Widget middleAppBarWidget = Padding(
      padding: EdgeInsets.only(top: Sizes.dimen_6.h),
      child: Text('Participated Contests',
          style: Theme.of(context).textTheme.headline6),
    );

    Widget rightAppBarWidget = Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.dimen_16.w,
        vertical: Sizes.dimen_8.h,
      ),
      child: Icon(
        Icons.notifications_active_outlined,
        color: Colors.black,
      ),
    );
    return Scaffold(
        appBar: CoddrAppBar(
          leftWidget: leftAppBarWidget,
          middleWidget: middleAppBarWidget,
          rightWidget: rightAppBarWidget,
        ),
        body: BlocBuilder<ParticipatedContestBloc, ParticipatedContestState>(
          bloc: _participatedContestBloc,
          builder: (context, state) {
            List<CuratedContestModel> curatedContestModelList = [];
            if (state is ParticipatedContestLoadingState ||
                state is ParticipatedContestInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ParticipatedContestFailedState) {
              return Center(
                child: Text("Something went wrong!! Please Refresh"),
              );
            }
            curatedContestModelList = (state as ParticipatedContestSuccessState)
                .curatedContestModelList;

            curatedContestModelList = sortContest(curatedContestModelList);

            return Container(
              height: screenHeight,
              width: screenWidth,
              child: Column(children: [
                PHistory(
                    coins: widget.coins,
                    contest: widget.contest,
                    wins: widget.wins),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                      itemCount: curatedContestModelList.length,
                      itemBuilder: (context, index) {
                        return ParticipatedCuratedContestCard(
                          curatedContestModel: curatedContestModelList[index],
                        );
                      }),
                ),
              ]),
            );
          },
        ));
  }
}
