import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/screen_utils/screen_util.dart';
import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/presentation/blocs/contest_listing/contest_listing_bloc.dart';
import 'package:intl/intl.dart';
import 'package:coddr/domain/entities/contest_entity.dart';

import 'package:coddr/presentation/journeys/upcoming_contests/contest_card.dart';
import 'package:coddr/presentation/themes/app_color.dart';
import 'package:coddr/presentation/widgets/CoddrAppBar.dart';
import 'package:coddr/presentation/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingContestsScreen extends StatelessWidget {
  static const routeName = '/upcoming_contests_screen';
  ContestListingBloc _contestListingBloc;

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
    _contestListingBloc = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CoddrAppBar(),
      drawer: MainDrawer(),
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
                        backgroundColor: Colors.black,
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
