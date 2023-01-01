import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/domain/usecases/get_uid.dart';
import 'package:coddr/presentation/journeys/home/home_screen.dart';
import 'package:coddr/presentation/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/screen_utils/screen_util.dart';
import '../../blocs/profile/profile_bloc.dart';
import '../../themes/app_color.dart';

class CompleteProfile extends StatefulWidget {
  static String routeName = "/complete_profile";
  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  GetUid getUid;

  String name;
  String contactNumber;
  String occupation;
  String CFHandel;

  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController cfHandelController = TextEditingController();

  @override
  void initState() {
    getUid = getItInstance<GetUid>();
    super.initState();
  }

  @override
  Widget build(Object context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    ScreenUtil.init(height: screenHeight, width: screenWidth);

    final arg = ModalRoute.of(context).settings.arguments as Map;
    String email = arg['email'];

    return Scaffold(
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Theme.of(context).errorColor,
              ),
            );
          }

          if (state is ProfileUpdated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Profile Updated!"),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.of(context).popAndPushNamed(HomeScreen.routeName);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
              child: Container(
            width: screenWidth,
            padding: EdgeInsets.symmetric(
                vertical: Sizes.dimen_20.h, horizontal: Sizes.dimen_14.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Sizes.dimen_24.h,
                ),
                Image.asset(Images.editUserIcon),
                Text(
                  "Complete your profile",
                  style: ThemeText.headline5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: Sizes.dimen_2.h),
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      fillColor: Colors.white70,
                    ),
                    controller: nameController,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: Sizes.dimen_2.h),
                  child: TextField(
                    controller: contactController,
                    decoration: InputDecoration(
                      labelText: "Contact Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      fillColor: Colors.white70,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: Sizes.dimen_2.h),
                  child: TextField(
                    controller: occupationController,
                    decoration: InputDecoration(
                      labelText: "Occupation",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      fillColor: Colors.white70,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: Sizes.dimen_2.h),
                  child: TextField(
                    controller: cfHandelController,
                    decoration: InputDecoration(
                      labelText: "Codeforces Handel",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      fillColor: Colors.white70,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    UserModel newUser = UserModel(
                      email: email,
                      uid: getUid(),
                      city: "",
                      state: "",
                      country: "",
                      imageUrl: "",
                      displayName: nameController.text,
                      contactNumber: contactController.text,
                      institution: "",
                      occupation: occupationController.text,
                      handelCF: cfHandelController.text,
                      handelCC: "",
                      handelHE: "",
                      handelATC: "",
                      coins: UserModel.defaultCoins,
                      contest: 0,
                      isAdmin: false,
                      isEmailVerified: true,
                      isHandelATCVerified: false,
                      isHandelCCVerified: false,
                      isHandelCFVerified: false,
                      isHandelHEVerified: false,
                      wins: 0,
                    );

                    BlocProvider.of<ProfileBloc>(context)
                        .add(StoreProfileData(userModel: newUser));
                  },
                  child: (state is ProfileLoding)
                      ? Center(child: CircularProgressIndicator())
                      : Text(
                          "Update Profile",
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                  style: TextButton.styleFrom(
                      backgroundColor: AppColor.lightViolet,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                      )),
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}
