import 'package:coddr/data/repositories/platform_repository_impl.dart';
import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/domain/entities/no_params.dart';
import 'package:coddr/domain/usecases/get_cf_contest_list.dart';
import 'package:coddr/presentation/blocs/bloc/contest_listing_bloc.dart';
import 'package:coddr/presentation/widgets/CoddrAppBar.dart';
import 'package:coddr/presentation/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

import 'package:coddr/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:coddr/presentation/journeys/home/platform_grid.dart';
import 'package:coddr/common/screen_utils/screen_util.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'top_home_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ContestListingBloc _contestListingBloc;

  @override
  void initState() {
    _contestListingBloc = getItInstance<ContestListingBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _contestListingBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);
    print(screenHeight);
    ScreenUtil.init(height: screenHeight, width: screenWidth);

    return BlocProvider<ContestListingBloc>.value(
      value: _contestListingBloc,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CoddrAppBar(),
        drawer: MainDrawer(),
        body: Padding(
          padding: EdgeInsets.only(
              left: Sizes.dimen_16.w,
              right: Sizes.dimen_16.w,
              top: Sizes.dimen_12.h),
          child: Column(
            children: [
              TopHomeScreen(),
              SizedBox(
                height: Sizes.dimen_30.w,
              ),
              Text(
                "Get Started with your favourite platform",
                style: Theme.of(context).textTheme.headline5,
              ),
              Expanded(child: PlatformGrid()),
              CustomBottomNavigationBar(),
            ],
          ),
        ),
      ),
    );
  }
}
