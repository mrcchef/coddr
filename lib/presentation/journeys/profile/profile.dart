import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/presentation/blocs/profile/profile_bloc.dart';
import 'package:coddr/presentation/journeys/profile/Widgets/Image_section.dart';
import 'package:coddr/presentation/journeys/profile/Widgets/PHandles.dart';
import 'package:coddr/presentation/journeys/profile/Widgets/PHistory.dart';
import 'package:coddr/presentation/journeys/profile/Widgets/Ploacation.dart';
import 'package:coddr/presentation/journeys/profile/Widgets/userDetails.dart';
import 'package:coddr/presentation/journeys/profile/edit_profile.dart';
import 'package:coddr/presentation/widgets/CoddrAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

enum Page { accountinfo, editinfo }

class Profile extends StatefulWidget {
  static const routeName = '/profile';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileBloc _profileBloc;
  Page _selectedPage = Page.accountinfo;

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
    Widget leftAppBarWidget = InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      // child: Padding(
      //   padding: EdgeInsets.only(bottom: Sizes.dimen_10.w),
      child: Icon(Icons.arrow_back_ios, color: Colors.black),
      //),
    );

    Widget middleAppBarWidget = Padding(
      padding: EdgeInsets.only(
        top: Sizes.dimen_6.h,
        left: Sizes.dimen_16.w,
      ),
      child: Text('Coddr', style: Theme.of(context).textTheme.headline5),
    );

    Widget rightAppBarWidget = Padding(
        padding: EdgeInsets.only(
          //horizontal: Sizes.dimen_16.w,
          //vertical: Sizes.dimen_4.h,
          top: Sizes.dimen_14.w,
          right: Sizes.dimen_8.w,
        ),
        child: InkWell(
          onTap: () {
            print("edit button pressed");
            Navigator.of(context).popAndPushNamed(EditProfile.routeName);
          },
          child: Row(
            children: [
              Text(
                'Edit',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Colors.red[700],
                      fontSize: Sizes.dimen_20.w,
                    ),
                // TextStyle(
                //   fontSize: 16,
                //   color: HexColor('#d91f2a'),
                //   fontWeight: FontWeight.w400,
                // ),
              ),
              SizedBox(width: Sizes.dimen_2.w),
              Icon(
                Icons.edit,
                
                color: Colors.red[700],
              ),
            ],
          ),
        )
        // TextButton.icon(
        //   onPressed: () {
        //     print("edit button pressed");
        //     Navigator.of(context).popAndPushNamed(EditProfile.routeName);
        //   },
        //   label: Text('Edit',
        //       style: TextStyle(
        //         fontSize: 16,
        //         color: HexColor('#d91f2a'),
        //         fontWeight: FontWeight.bold,
        //       )),
        //   icon: Icon(
        //     Icons.edit,
        //     color: HexColor('#d91f2a'),
        //   ),
        // ),
        );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CoddrAppBar(
        leftWidget: leftAppBarWidget,
        middleWidget: middleAppBarWidget,
        rightWidget: rightAppBarWidget,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
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
          print(userModel.contactNumber);
          print(userModel.handelCC);
          return ListView(
            padding: EdgeInsets.only(top: 0),
            children: [
              ImageSection(userModel.imageUrl),
              SizedBox(
                height: 18,
              ),
              Divider(
                thickness: 2.5,
              ),
              UserDetails(
                email: userModel.email,
                displayName: userModel.displayName,
                contactNumber: userModel.contactNumber == null
                    ? ""
                    : userModel.contactNumber,
              ),
              Divider(
                thickness: 2.5,
              ),
              PHistory(
                coins: userModel.coins == null ? 0 : userModel.coins,
                contest: userModel.contest == null ? 0 : userModel.contest,
                wins: userModel.wins == null ? 0 : userModel.wins,
              ),
              Divider(
                thickness: 2.5,
              ),
              PHandles(
                handelCF: userModel.handelCF == null ? "" : userModel.handelCF,
                handelCC: userModel.handelCC == null ? "" : userModel.handelCC,
                handelHE: userModel.handelHE == null ? "" : userModel.handelHE,
              ),
              Divider(
                thickness: 2.5,
              ),
              Plocation(
                city: userModel.city == null ? "" : userModel.city,
                state: userModel.state == null ? "" : userModel.state,
                country: userModel.country == null ? "" : userModel.country,
              ),
              Divider(
                thickness: 2.5,
              ),
            ],
          );
        },
      ),
    );
  }
}
