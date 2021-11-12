import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/domain/entities/curated_contest_model.dart';
import 'package:coddr/presentation/blocs/participated_contest/participated_contest_bloc.dart';
import 'package:coddr/presentation/widgets/CoddrAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParticipatedContestScreen extends StatefulWidget {
  final String uid;
  const ParticipatedContestScreen({Key key, @required this.uid})
      : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    Widget leftAppBarWidget = InkWell(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      child: Icon(Icons.menu, color: Colors.black),
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
            print("State $state");
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
            print(curatedContestModelList);

            return ListView.builder(
                itemCount: curatedContestModelList.length,
                itemBuilder: (context, index) {
                  return Text("Text");
                  //  ParticipatedCuratedContestCard(
                  //   curatedContestModel: curatedContestModel,
                  //   startTime: startTime,
                  //   endTime: endTime,
                  //   title: title,
                  // );
                });
          },
        ));
  }
}
