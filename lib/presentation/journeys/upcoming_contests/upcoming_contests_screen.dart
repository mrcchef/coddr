import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/domain/entities/contest_entity.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/presentation/blocs/contest_listing/contest_listing_bloc.dart';
import 'package:coddr/presentation/journeys/upcoming_contests/contest_card.dart';
import 'package:coddr/presentation/themes/app_color.dart';
import 'package:coddr/presentation/widgets/CoddrAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class UpcomingContestsScreen extends StatefulWidget {
  static const routeName = '/upcoming_contests_screen';

  @override
  State<UpcomingContestsScreen> createState() => _UpcomingContestsScreenState();
}

class _UpcomingContestsScreenState extends State<UpcomingContestsScreen> {
  ContestListingBloc _contestListingBloc;

  @override
  void initState() {
    _contestListingBloc = getItInstance<ContestListingBloc>();
    _contestListingBloc.add(PlatformSelectedEvent());
    super.initState();
  }

  @override
  void dispose() {
    _contestListingBloc.close();
    super.dispose();
  }

  final List<Color> cardColors = [
    AppColor.lightGreen,
    AppColor.lightRed,
    AppColor.lightViolet,
    AppColor.lightBrown,
  ];

  List<ContestEntity> extractContests(List<ContestEntity> contestList) {
    List<ContestEntity> upcomingContestList = [];
    contestList.forEach((element) {
      if (element.phase == 'BEFORE') {
        upcomingContestList.add(element);
      }
    });

    return upcomingContestList.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    Widget leftAppBarWidget = InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Icon(Icons.arrow_back_ios, color: Colors.black),
    );

    Widget middleAppBarWidget = Padding(
      padding: EdgeInsets.only(top: Sizes.dimen_6.h),
      child: Text('Coddr', style: Theme.of(context).textTheme.headline5),
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
      backgroundColor: Colors.white,
      appBar: CoddrAppBar(
        leftWidget: leftAppBarWidget,
        middleWidget: middleAppBarWidget,
        rightWidget: rightAppBarWidget,
      ),
      //drawer: MainDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_16.w,
          vertical: Sizes.dimen_8.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Upcoming Contests',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontSize: Sizes.dimen_26.w),
                  ),
                  Spacer(),
                  Image.asset(
                    Images.codeforcesLogo,
                    //fit: BoxFit.fitHeight,
                    height: Sizes.dimen_48.w,
                    width: Sizes.dimen_48.w,
                  ),
                ],
              ),
              SizedBox(height: Sizes.dimen_8.h),
              BlocBuilder<ContestListingBloc, ContestListingState>(
                bloc: _contestListingBloc,
                builder: (context, state) {
                  if (state is ContestListFetchingState)
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                        backgroundColor: Colors.green,
                      ),
                    );
                  else if (state is ContestListFetchedState) {
                    List<ContestEntity> upcomingContestList =
                        extractContests(state.contestList);

                    return SingleChildScrollView(
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: upcomingContestList.length,
                        itemBuilder: (context, index) {
                          DateTime startTime = DateTime.now().add(new Duration(
                              seconds: upcomingContestList[index]
                                      .relativeTimeSeconds *
                                  -1));
                          DateTime endTime = startTime.add(new Duration(
                              seconds:
                                  upcomingContestList[index].durationSeconds));
                          return ContestCard(
                            title: upcomingContestList[index].name,
                            color: cardColors[index % 4],
                            time:
                                '${DateFormat('HH:mm').format(startTime)} - ${DateFormat('HH:mm').format(endTime)}',
                            date: DateFormat('dd/MMM/yyyy').format(startTime),
                            contestId: upcomingContestList[index].id,
                            platformId:
                                upcomingContestList[index].platformHandle,
                            startTime: startTime,
                            endtime: endTime,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(color: Colors.white),
                      ),
                    );
                  } else if (state is ContestListErrorState) {
                    return Center(
                      child: Text("${state.appErrorType}"),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
