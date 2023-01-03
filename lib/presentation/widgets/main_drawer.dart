import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/presentation/blocs/profile/profile_bloc.dart';
import 'package:coddr/presentation/journeys/Rewards/rewards_page.dart';
import 'package:coddr/presentation/journeys/about_us/about_us.dart';
import 'package:coddr/presentation/journeys/auth/sign_in_screen.dart';
import 'package:coddr/presentation/journeys/participated_contest/participated_contest_screen.dart';
import 'package:coddr/presentation/journeys/profile/profile_screen.dart';
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
    Widget getDrawerTile(String title, String imagePath, Function onTap) {
      return InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_10.w),
          child: Row(
            children: [
              SizedBox(
                child: Image.asset(imagePath),
                height: Sizes.dimen_24.h,
                width: Sizes.dimen_24.h,
              ),
              SizedBox(
                width: Sizes.dimen_14.w,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      );
    }

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
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        (userModel.imageUrl != "" && userModel.imageUrl != null)
                            ? NetworkImage(userModel.imageUrl)
                            : AssetImage(Images.defaultUserImage),
                  ),
                ),
                SizedBox(height: Sizes.dimen_10.w),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Sizes.dimen_2.h,
                    horizontal: Sizes.dimen_20.w,
                  ),
                  child: Text(
                    (userModel.displayName == null)
                        ? "User Name"
                        : userModel.displayName,
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.start,
                  ),
                ),
                getDrawerTile(
                  'Profile',
                  Images.userIcon,
                  () {
                    Navigator.of(context)
                        .popAndPushNamed(ProfileScreen.routeName);
                  },
                ),
                getDrawerTile(
                  'Participated Contests',
                  Images.pastContest,
                  () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ParticipatedContestScreen(
                              uid: userModel.uid,
                              coins: userModel.coins,
                              contest: userModel.contest,
                              wins: userModel.wins,
                            )));
                  },
                ),

                getDrawerTile('Rewards', Images.rewardIcon, () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RewardsPage(
                                coins: userModel.coins,
                              )));
                }),
                getDrawerTile('About Us', Images.infoIcon, () {
                  Navigator.of(context).popAndPushNamed(AboutUs.routeName);
                }),
                getDrawerTile(
                  'Sign Out',
                  Images.logoutIcon,
                  () {
                    Navigator.of(context)
                        .popAndPushNamed(SignInScreen.routeName);
                    // BlocProvider.of<AuthenticationBloc>(context)
                    //     .add(SiggnedOutEvent());
                  },
                ),
                // DrawerListTile('Profile', Icons.abc, () {
                //   Navigator.of(context).popAndPushNamed(Profile.routeName);
                // }),

                // DrawerListTile('Participated Contests', Icons.timeline, () {
                //   Navigator.of(context).pop();
                //   Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) =>
                //           ParticipatedContestScreen(uid: userModel.uid)));
                // }),
                // // DrawerListTile('Activity', Icons.timeline, () {}),
                // DrawerListTile('Rewards', Icons.redeem, () {
                //   Navigator.of(context).pop();
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => RewardsPage(
                //                 coins: userModel.coins,
                //               )));
                // }),
                // DrawerListTile(
                //     'About Us', Icons.sentiment_satisfied_alt_outlined, () {
                //   Navigator.of(context).popAndPushNamed(AboutUs.routeName);
                // }),
                // DrawerListTile('Sign Out', Icons.logout, () {
                //   Navigator.of(context).popAndPushNamed(SignInScreen.routeName);
                //   // BlocProvider.of<AuthenticationBloc>(context)
                //   //     .add(SiggnedOutEvent());
                // }),
              ],
            );
          },
        ),
      ),
    );
  }
}
