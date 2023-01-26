import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/presentation/blocs/profile/profile_bloc.dart';
import 'package:coddr/presentation/journeys/profile/Widgets/Image_section.dart';
import 'package:coddr/presentation/journeys/profile/Widgets/PHandles.dart';
import 'package:coddr/presentation/journeys/profile/edit_profile.dart';
import 'package:coddr/presentation/widgets/CoddrAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Page { accountinfo, editinfo }

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile_screen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    Widget leftAppBarWidget = InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_16.w,
        ),
        child: Icon(Icons.arrow_back_ios, color: Colors.black),
      ),
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
              ),
              SizedBox(width: Sizes.dimen_2.w),
              Icon(
                Icons.edit,
                color: Colors.red[700],
              ),
            ],
          ),
        ));

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
          return Container(
            height: screenHeight,
            width: screenWidth,
            child: Stack(
              children: [
                ImageSection(
                  imageUrl: userModel.imageUrl,
                  contactNumber: userModel.contactNumber,
                  displayName: userModel.displayName,
                  email: userModel.email,
                ),
                Positioned(
                  top: Sizes.dimen_120.h,
                  child: PHandles(
                    uid: userModel.uid,
                    email: userModel.email,
                    handelCF:
                        userModel.handelCF == null ? "" : userModel.handelCF,
                    handelCC:
                        userModel.handelCC == null ? "" : userModel.handelCC,
                    handelHE:
                        userModel.handelHE == null ? "" : userModel.handelHE,
                    isHandelCFVerified:
                        (userModel.isHandelCFVerified) ? true : false,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
