import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/presentation/blocs/profile/profile_bloc.dart';
import 'package:coddr/presentation/journeys/Rewards/rewards_page.dart';
import 'package:coddr/presentation/journeys/about_us/about_us.dart';
import 'package:coddr/presentation/journeys/auth/sign_in_screen.dart';
import 'package:coddr/presentation/journeys/profile/profile.dart';
import 'package:coddr/presentation/widgets/drawer_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  ProfileBloc _profileBloc;
  @override
  void initState() {
    _profileBloc = getItInstance<ProfileBloc>();
    _profileBloc.add(FetchProfileData());
    super.initState();
  }

  @override
  void dispose() {
    _profileBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          bloc: _profileBloc,
          builder: (context, state) {
            if (state is ProfileLoding) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is ProfileError) {
              return Center(child: Text(state.message));
            }

            final curState = (state as ProfileLoaded);
            UserModel userModel = curState.userModel;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Sizes.dimen_14.h),
                Container(
                  height: Sizes.dimen_140.w,
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: Sizes.dimen_20.w,
                    left: Sizes.dimen_20.w,
                  ),
                  alignment: Alignment.centerLeft,
                  //  child:Positioned(
                  // top: 125,
                  // right: 135,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        (userModel.imageUrl != "" && userModel.imageUrl != null)
                            ? NetworkImage(userModel.imageUrl)
                            : AssetImage(Images.defaultUserImage),
                    //backgroundImage: AssetImage('assets/images/kshittiz2.jpg'),
                    // ),
                  ),
                  // child: CircleAvatar(
                  //   radius: 60,
                  //   child: (userModel.imageUrl == null)
                  //       ? Image.asset(
                  //           Images.defaultUserImage,
                  //           fit: BoxFit.cover,
                  //         )
                  //       : Image.network(userModel.imageUrl),
                  // ),
                ),
                SizedBox(height: Sizes.dimen_10.w),
                Padding(
                  padding: EdgeInsets.only(
                    left: Sizes.dimen_30.w,
                  ),
                  child: Text(
                    (userModel.displayName == null)
                        ? "User Name"
                        : userModel.displayName,
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.start,
                  ),
                ),
                DrawerListTile('Profile', Icons.person_outline_outlined, () {
                  Navigator.of(context).popAndPushNamed(Profile.routeName);
                }),
                // DrawerListTile('Activity', Icons.timeline, () {}),
                 DrawerListTile('Rewards', Icons.settings, () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => RewardsPage()));
                 }),
                DrawerListTile(
                    'About Us', Icons.sentiment_satisfied_alt_outlined, () {
                  Navigator.of(context).popAndPushNamed(AboutUs.routeName);
                }),
                DrawerListTile('Sign Out', Icons.logout, () {
                  Navigator.of(context).popAndPushNamed(SignInScreen.routeName);
                  // BlocProvider.of<AuthenticationBloc>(context)
                  //     .add(SiggnedOutEvent());
                }),
              ],
            );
          },
        ),
      ),
    );
  }
}
