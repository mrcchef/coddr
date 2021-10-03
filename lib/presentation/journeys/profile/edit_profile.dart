import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/presentation/blocs/profile/profile_bloc.dart';
import 'package:coddr/presentation/journeys/profile/profile.dart';
import 'package:coddr/presentation/widgets/CoddrAppBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  static const routeName = '\edit-profile';
  const EditProfile({Key key}) : super(key: key);

  //EditProfile(UserModel userModel);

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

  //EDIT IMAGE
  File _pickedImage;
  //UserModel userModel;
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
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController institutecontroller = TextEditingController();
  TextEditingController cfHandleController = TextEditingController();
  TextEditingController ccHandleController = TextEditingController();
  TextEditingController heHandleController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  bool _isLoading = false;
  String prevImageUrl;
  String url;
  void _saveForm() async {
    setState(() {
      _isLoading = true;
    });
    if (!_formkey.currentState.validate()) {
      setState(() {
        _isLoading = false;
      });
      print("INVALID");
    }
    try {
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

      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser.uid)
          .update({
        'imageUrl': url,
        'displayName': displayName,
        'contactNumber': contactNumber,
        'institution': institution,
        'occupation': occupation,
        'handelCF': handelCF,
        'handelCC': handelCC,
        'handelHE': handelHE,
        'city': city,
        'state': state,
        'country': country,
      });
      // print(url);
      Navigator.popAndPushNamed(context, Profile.routeName);
      setState(() {
        _isLoading = false;
      });
    } on PlatformException catch (err) {
      var message = 'An error occured, please check your credentials!';

      if (err.message != null) {
        message = err.message;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      print("Error2");
      print(err);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget leftAppBarWidget = InkWell(
      onTap: () {
        Navigator.of(context).popAndPushNamed(Profile.routeName);
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

    return Scaffold(
      appBar: CoddrAppBar(
        leftWidget: leftAppBarWidget,
        middleWidget: middleAppBarWidget,
        rightWidget: Spacer(),
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
          namecontroller.text = userModel.displayName;
          phonecontroller.text = userModel.contactNumber;
          institutecontroller.text = userModel.institution;
          cfHandleController.text = userModel.handelCF;
          ccHandleController.text = userModel.handelCC;
          heHandleController.text = userModel.handelHE;
          cityController.text = userModel.city;
          stateController.text = userModel.state;
          countryController.text = userModel.country;
          prevImageUrl = userModel.imageUrl;
          return (_isLoading == false)
              ? Form(
                  key: _formkey,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      //PEditImage(),
                      editImage(),
                      SizedBox(
                        height: 25,
                      ),
                      //PEditDetails(),
                      editDetails(),
                      //Pedithandles(),
                      editHandles(),
                      SizedBox(
                        height: 25,
                      ),
                      //PEditDetails(),
                      editLocation(),
                      SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: RaisedButton(
                          onPressed: _saveForm,
                          color: HexColor('#d91f2a'),
                          child: Text(
                            'Save Changes',
                            style: TextStyle(color: Colors.white),
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

  Widget editHandles() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(
            'Edit handles',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Text('Codeforces'),
              Spacer(),
              Container(
                height: 20,
                width: 230,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Enter Username',
                      hintStyle: TextStyle(fontSize: 14)),
                  style: TextStyle(color: Colors.black),
                  controller: cfHandleController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    handelCF = value;
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text('CodeChef'),
              Spacer(),
              Container(
                height: 20,
                width: 230,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Enter Username',
                      hintStyle: TextStyle(fontSize: 14)),
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
                  controller: ccHandleController,
                  onSaved: (value) {
                    handelCC = value;
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text('Hackerearth'),
              Spacer(),
              Container(
                height: 20,
                width: 230,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Enter Username',
                      hintStyle: TextStyle(fontSize: 14)),
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
                  controller: heHandleController,
                  onSaved: (value) {
                    handelHE = value;
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget editLocation() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(
            'Edit Location',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Text('City'),
              Spacer(),
              Container(
                height: 20,
                width: 230,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Enter City',
                      hintStyle: TextStyle(fontSize: 14)),
                  style: TextStyle(color: Colors.black),
                  controller: cityController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter City';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    city = value;
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text('State'),
              Spacer(),
              Container(
                height: 20,
                width: 230,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Enter State',
                      hintStyle: TextStyle(fontSize: 14)),
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter State';
                    }
                    return null;
                  },
                  controller: stateController,
                  onSaved: (value) {
                    state = value;
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text('Country'),
              Spacer(),
              Container(
                height: 20,
                width: 230,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Enter Country',
                      hintStyle: TextStyle(fontSize: 14)),
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Country';
                    }
                    return null;
                  },
                  controller: countryController,
                  onSaved: (value) {
                    country = value;
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget editDetails() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Please Enter Your Name',
              style: TextStyle(fontSize: 14, color: Colors.grey)),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 20,
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              controller: namecontroller,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please Enter Name';
                }
                return null;
              },
              onSaved: (value) {
                displayName = value;
              },
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'Please enter your Phone Number',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            child: TextFormField(
              controller: phonecontroller,
              style: TextStyle(color: Colors.black),
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
                print(contactNumber);
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text('Please Enter Your Institution',
              style: TextStyle(fontSize: 14, color: Colors.grey)),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 20,
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              controller: institutecontroller,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please Enter Name';
                }
                return null;
              },
              onSaved: (value) {
                institution = value;
              },
            ),
          ),
          SizedBox(
            height: 33,
          ),
          Row(
            children: [
              Text('Student/Profession',
                  style: TextStyle(fontSize: 14, color: Colors.black)),
              SizedBox(
                width: 35,
              ),
              Container(
                color: Colors.grey[300],
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                    focusColor: Colors.pink,
                    value: occupation,
                    dropdownColor: Colors.grey,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    icon: Icon(Icons.arrow_drop_down),
                    iconEnabledColor: Colors.black,
                    onChanged: (newvalue) {
                      setState(() {
                        //stpr = newvalue;
                        occupation = newvalue;
                      });
                    },
                    items: <String>['Student', 'Profession']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget editImage() {
    return Center(
      child: InkWell(
        child: Stack(
          children: [
            Container(
              child: CircleAvatar(
                radius: 60.0,
                backgroundImage: (_pickedImage != null)
                    ? (FileImage(_pickedImage))
                    : (prevImageUrl != "")
                        ? NetworkImage(prevImageUrl)
                        : AssetImage(Images.defaultUserImage),
                backgroundColor: Colors.transparent,
              ),
              decoration: new BoxDecoration(
                // border color
                shape: BoxShape.circle,
                border: Border.all(
                  width: 4.0,
                  color: HexColor('#6f6434'),
                ),
              ),
            ),
            Positioned(
              height: 55,
              width: 120,
              left: 4,
              bottom: 6,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(70),
                        bottomRight: Radius.circular(70))),
                child: InkWell(
                  child: Center(
                    child: Text(
                      'Edit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: _pickImage,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
