import 'dart:io';

import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/presentation/blocs/profile/profile_bloc.dart';
import 'package:coddr/presentation/journeys/profile/profile_screen.dart';
import 'package:coddr/presentation/themes/app_color.dart';
import 'package:coddr/presentation/themes/themes.dart';
import 'package:coddr/presentation/widgets/CoddrAppBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  static const routeName = '/edit-profile';
  EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  ProfileBloc _profileBloc;
  GlobalKey<FormState> _formkey = GlobalKey();

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

  var imageUrl, displayName, contactNumber;
  var handelCF, handelCC, handelHE, institution;
  var city, country, state;
  String occupation = 'Student';

  File _pickedImage;
  void _pickImage() async {
    final pickedImageFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: Sizes.dimen_150.w,
    );
    setState(() {
      _pickedImage = File(pickedImageFile.path);
    });
  }

  //EDIT DETAILS
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController instituteController = TextEditingController();
  TextEditingController cfHandleController = TextEditingController();
  TextEditingController ccHandleController = TextEditingController();
  TextEditingController heHandleController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  bool _isLoading = false;
  String prevImageUrl;
  String url;
  void _saveForm(UserModel userModel) async {
    if (!_formkey.currentState.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill the fields according to Rules"),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      return;
    }

    _formkey.currentState.save();
    if (_pickedImage != null) {
      final ref = FirebaseStorage.instance
          .ref()
          .child('user_image')
          .child(FirebaseAuth.instance.currentUser.uid)
          .child(FirebaseAuth.instance.currentUser.uid + '.jpg');
      await ref.putFile(_pickedImage).whenComplete(() => null);
      url = await ref.getDownloadURL();
    } else {
      url = prevImageUrl;
    }

    if (userModel.isHandelCFVerified) handelCF = userModel.handelCF;

    UserModel updatedUserModel = UserModel(
      email: userModel.email,
      uid: userModel.uid,
      city: city,
      state: state,
      country: country,
      imageUrl: url,
      displayName: displayName,
      contactNumber: contactNumber,
      institution: institution,
      occupation: occupation,
      handelCF: handelCF,
      handelCC: handelCC,
      handelHE: handelHE,
      coins: userModel.coins,
      contest: userModel.contest,
      handelATC: userModel.handelATC,
      isAdmin: userModel.isAdmin,
      isEmailVerified: userModel.isEmailVerified,
      isHandelATCVerified: userModel.isHandelATCVerified,
      isHandelCCVerified: userModel.isHandelCCVerified,
      isHandelCFVerified: userModel.isHandelCFVerified,
      isHandelHEVerified: userModel.isHandelHEVerified,
      wins: userModel.wins,
    );

    _profileBloc.add(UpdateProfileData(userModel: updatedUserModel));
  }

  @override
  Widget build(BuildContext context) {
    UserModel userModel;
    Widget leftAppBarWidget = InkWell(
      onTap: () {
        Navigator.of(context).popAndPushNamed(ProfileScreen.routeName);
      },
      child: Icon(Icons.arrow_back_ios, color: Colors.black),
    );

    Widget middleAppBarWidget = Padding(
      padding: EdgeInsets.only(
        top: Sizes.dimen_6.h,
        left: Sizes.dimen_16.w,
      ),
      child: Text('Coddr', style: Theme.of(context).textTheme.headline5),
    );

    return Scaffold(
      appBar: CoddrAppBar(
        leftWidget: leftAppBarWidget,
        middleWidget: middleAppBarWidget,
        rightWidget: Spacer(),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        bloc: _profileBloc,
        listener: ((context, state) {
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
            Navigator.pushReplacementNamed(context, ProfileScreen.routeName);
          }
        }),
        builder: (context, state) {
          if (state is ProfileLoding) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is ProfileError) {
            return Center(child: Text(state.message));
          }

          if (state is ProfileUpdated) {
            return Center(child: CircularProgressIndicator());
          }

          final curState = (state as ProfileLoaded);
          userModel = curState.userModel;
          nameController.text = userModel.displayName;
          phoneController.text = userModel.contactNumber;
          instituteController.text = userModel.institution;
          cfHandleController.text = userModel.handelCF;
          ccHandleController.text = userModel.handelCC;
          heHandleController.text = userModel.handelHE;
          cityController.text = userModel.city;
          stateController.text = userModel.state;
          countryController.text = userModel.country;
          occupationController.text = userModel.occupation;
          prevImageUrl = userModel.imageUrl;
          return (_isLoading == false)
              ? Form(
                  key: _formkey,
                  child: ListView(
                    children: [
                      editImage(),
                      editDetails(),
                      editHandles(userModel),
                      // editLocation(),
                      Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: Sizes.dimen_10.w,
                              horizontal: Sizes.dimen_10.w),
                          child: ElevatedButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColor.lightBlue,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(Sizes.dimen_20.w)),
                            ),
                            onPressed: () => _saveForm(userModel),
                            child: Text(
                              'Save Changes',
                              style: ThemeText.button,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  Widget editHandles(UserModel userModel) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_18.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.symmetric(
                  vertical: Sizes.dimen_8.w, horizontal: Sizes.dimen_14.w),
              child: Text('Edit handles', style: ThemeText.headline6)),
          Container(
            padding: EdgeInsets.symmetric(vertical: Sizes.dimen_4.h),
            child: TextFormField(
              autocorrect: true,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                prefixIcon: Container(
                  padding: EdgeInsets.all(Sizes.dimen_8.w),
                  child: Image.asset(Images.codeforcesLogo,
                      height: Sizes.dimen_30.w),
                ),
                labelText: "Codeforces",
                labelStyle: TextStyle(color: Colors.brown[200]),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: Sizes.dimen_4.w, color: AppColor.lightYellow),
                  borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: Sizes.dimen_4.w, color: AppColor.lightYellow),
                  borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                ),
                contentPadding: EdgeInsets.all(Sizes.dimen_16.w),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[500]),
                fillColor: Colors.white70,
              ),
              controller: cfHandleController,
              style: ThemeText.bodyText1.copyWith(color: Colors.brown),
              validator: (value) {
                return null;
              },
              onSaved: (value) {
                handelCF = value;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: Sizes.dimen_4.h),
            child: TextFormField(
              autocorrect: true,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: "CodeChef",
                prefixIcon: Container(
                  padding: EdgeInsets.all(Sizes.dimen_8.w),
                  child: Image.asset(Images.codeChefLogo,
                      height: Sizes.dimen_30.w),
                ),
                labelStyle: TextStyle(color: Colors.purple[200]),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: Sizes.dimen_4.w, color: AppColor.lightViolet),
                  borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: Sizes.dimen_4.w, color: AppColor.lightViolet),
                  borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(Sizes.dimen_16.w),
                hintStyle: TextStyle(color: Colors.grey[500]),
                fillColor: Colors.white70,
              ),
              controller: ccHandleController,
              style: ThemeText.bodyText1.copyWith(color: Colors.purple),
              validator: (value) {
                return null;
              },
              onSaved: (value) {
                handelCC = value;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: Sizes.dimen_4.h),
            child: TextFormField(
              autocorrect: true,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: "Hacker Earth",
                prefixIcon: Container(
                  padding: EdgeInsets.symmetric(vertical: Sizes.dimen_8.w),
                  child: Image.asset(
                    Images.hackerEarthLogo,
                    height: Sizes.dimen_30.w,
                    width: Sizes.dimen_40.w,
                  ),
                ),
                labelStyle: TextStyle(color: Colors.brown[200]),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: Sizes.dimen_4.w, color: AppColor.lightBrown),
                  borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: Sizes.dimen_4.w, color: AppColor.lightBrown),
                  borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(Sizes.dimen_16.w),
                hintStyle: TextStyle(color: Colors.grey[500]),
                fillColor: Colors.white70,
              ),
              controller: heHandleController,
              style: ThemeText.bodyText1.copyWith(color: Colors.brown),
              validator: (value) {
                return null;
              },
              onSaved: (value) {
                handelHE = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget editLocation() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_18.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text('Edit Location', style: ThemeText.headline6),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: Sizes.dimen_4.h),
            child: TextFormField(
              autocorrect: true,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: "City",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(Sizes.dimen_16.w),
                hintStyle: TextStyle(color: Colors.grey[500]),
                fillColor: Colors.white70,
              ),
              controller: cityController,
              style: TextStyle(color: Colors.black),
              validator: (value) {
                // if (value.isEmpty) {
                //   return 'Occupation cannot be empty';
                // }
                return null;
              },
              onSaved: (value) {
                city = value;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: Sizes.dimen_4.h),
            child: TextFormField(
              autocorrect: true,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: "State",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(Sizes.dimen_16.w),
                hintStyle: TextStyle(color: Colors.grey[500]),
                fillColor: Colors.white70,
              ),
              controller: stateController,
              style: TextStyle(color: Colors.black),
              validator: (value) {
                // if (value.isEmpty) {
                //   return 'Occupation cannot be empty';
                // }
                return null;
              },
              onSaved: (value) {
                state = value;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: Sizes.dimen_4.h),
            child: TextFormField(
              autocorrect: true,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: "Country",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(Sizes.dimen_16.w),
                hintStyle: TextStyle(color: Colors.grey[500]),
                fillColor: Colors.white70,
              ),
              controller: countryController,
              style: TextStyle(color: Colors.black),
              validator: (value) {
                // if (value.isEmpty) {
                //   return 'Occupation cannot be empty';
                // }
                return null;
              },
              onSaved: (value) {
                country = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget editDetails() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_18.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: Sizes.dimen_4.h),
            child: TextFormField(
              autocorrect: true,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                prefixIcon: Container(
                  padding: EdgeInsets.all(Sizes.dimen_4.w),
                  child: Image.asset(Images.userIcon, height: Sizes.dimen_30.w),
                ),
                labelText: "Display Name",
                labelStyle: TextStyle(color: Colors.brown[200]),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: Sizes.dimen_4.w, color: AppColor.lightYellow),
                  borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: Sizes.dimen_4.w, color: AppColor.lightYellow),
                  borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                ),
                contentPadding: EdgeInsets.all(Sizes.dimen_16.w),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[500]),
                fillColor: Colors.white70,
              ),
              controller: nameController,
              style: ThemeText.bodyText1.copyWith(color: Colors.brown),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Name cannot be empty';
                }
                return null;
              },
              onSaved: (value) {
                displayName = value;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: Sizes.dimen_4.h),
            child: TextFormField(
              autocorrect: true,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                prefixIcon: Container(
                  padding: EdgeInsets.all(Sizes.dimen_4.w),
                  child:
                      Image.asset(Images.phoneIcon, height: Sizes.dimen_30.w),
                ),
                labelStyle: TextStyle(color: Colors.purple[200]),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: Sizes.dimen_4.w, color: AppColor.lightViolet),
                  borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: Sizes.dimen_4.w, color: AppColor.lightViolet),
                  borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                ),
                labelText: "Contact Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                ),
                contentPadding: EdgeInsets.all(Sizes.dimen_16.w),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[500]),
                fillColor: Colors.white70,
              ),
              controller: phoneController,
              style: ThemeText.bodyText1.copyWith(color: Colors.purple),
              keyboardType: TextInputType.phone,
              maxLength: 10,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please Enter Phone No';
                } else if (value.length < 10) {
                  return 'Enter 10 digit Phone number';
                }
                return null;
              },
              onSaved: (value) {
                contactNumber = value;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: Sizes.dimen_4.h),
            child: TextFormField(
              autocorrect: true,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                prefixIcon: Container(
                  padding: EdgeInsets.all(Sizes.dimen_4.w),
                  child: Image.asset(Images.institutionIcon,
                      height: Sizes.dimen_30.w),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: Sizes.dimen_4.w, color: AppColor.lightBrown),
                  borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: Sizes.dimen_4.w, color: AppColor.lightBrown),
                  borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                ),
                labelStyle: TextStyle(color: Colors.brown[200]),
                labelText: "Institution",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(Sizes.dimen_16.w),
                hintStyle: TextStyle(color: Colors.grey[500]),
                fillColor: Colors.white70,
              ),
              controller: instituteController,
              style: ThemeText.bodyText1.copyWith(color: Colors.brown),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Institution cannot be empty';
                }
                return null;
              },
              onSaved: (value) {
                institution = value;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: Sizes.dimen_4.h),
            child: TextFormField(
              autocorrect: true,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                prefixIcon: Container(
                  padding: EdgeInsets.all(Sizes.dimen_4.w),
                  child: Image.asset(Images.occupationIcon,
                      height: Sizes.dimen_30.w),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: Sizes.dimen_4.w, color: AppColor.lightBlue),
                  borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: Sizes.dimen_4.w, color: AppColor.lightBlue),
                  borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                ),
                labelStyle: TextStyle(color: Colors.blue[200]),
                labelText: "Occupation",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(Sizes.dimen_16.w),
                hintStyle: TextStyle(color: Colors.grey[500]),
                fillColor: Colors.white70,
              ),
              controller: occupationController,
              style: ThemeText.bodyText1.copyWith(color: Colors.blue),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Occupation cannot be empty';
                }
                return null;
              },
              onSaved: (value) {
                occupation = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget editImage() {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: Sizes.dimen_6.h,
        ),
        child: Stack(
          children: [
            Container(
              child: CircleAvatar(
                radius: Sizes.dimen_60.w,
                backgroundImage: (_pickedImage != null)
                    ? (FileImage(_pickedImage))
                    : (prevImageUrl != "")
                        ? NetworkImage(prevImageUrl)
                        : AssetImage(Images.defaultUserImage),
                backgroundColor: Colors.transparent,
              ),
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: Sizes.dimen_4.w,
                  color: Color(0xFF6f6434),
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: 80,
              child: InkWell(
                child: Image.asset(Images.editIcon, height: Sizes.dimen_60.w),
                onTap: _pickImage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
