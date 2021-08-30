import 'package:coddr/dependencies/get_it.dart';
import 'package:coddr/presentation/blocs/profile/profile_bloc.dart';
import 'package:coddr/presentation/journeys/profile/Widgets/Image_section.dart';
import 'package:coddr/presentation/journeys/profile/Widgets/PEditDetails.dart';
import 'package:coddr/presentation/journeys/profile/Widgets/PEditImage.dart';
import 'package:coddr/presentation/journeys/profile/Widgets/PHandles.dart';
import 'package:coddr/presentation/journeys/profile/Widgets/PHistory.dart';
import 'package:coddr/presentation/journeys/profile/Widgets/Ploacation.dart';
import 'package:coddr/presentation/journeys/profile/Widgets/editHandles.dart';
import 'package:coddr/presentation/journeys/profile/Widgets/userDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

enum Page { accountinfo, editinfo }

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileBloc _profileBloc;
  Page _selectedPage = Page.accountinfo;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: TextButton(
          onPressed: () {
            setState(() {
              _selectedPage = Page.accountinfo;
            });
          },
          child: Text('Profile',
              style: TextStyle(color: Colors.black, fontSize: 20)),
        ),
        centerTitle: true,
        actions: [
          TextButton.icon(
            onPressed: () {
              setState(() {
                _selectedPage = Page.editinfo;
              });
            },
            label: Text('Edit',
                style: TextStyle(
                  fontSize: 16,
                  color: HexColor('#d91f2a'),
                  fontWeight: FontWeight.bold,
                )),
            icon: Icon(
              Icons.edit,
              color: HexColor('#d91f2a'),
            ),
          )
        ],
      ),
      body: _loadScreen(),
    );
  }

  Widget _loadScreen() {
    switch (_selectedPage) {
      case Page.accountinfo:
        return Scaffold(
          body: ListView(
            padding: EdgeInsets.only(top: 0),
            children: [
              ImageSection(),
              SizedBox(
                height: 18,
              ),
              Divider(
                thickness: 2.5,
              ),
              UserDetails(),
              Divider(
                thickness: 2.5,
              ),
              PHistory(),
              Divider(
                thickness: 2.5,
              ),
              PHandles(),
              Divider(
                thickness: 2.5,
              ),
              Plocation(),
              Divider(
                thickness: 2.5,
              ),
            ],
          ),
        );

      case Page.editinfo:
        return Scaffold(
          body: Form(
            key: _formkey,
            child: ListView(
              children: [
                SizedBox(
                  height: 25,
                ),
                PEditImage(),
                SizedBox(
                  height: 25,
                ),
                PEditDetails(),
                Pedithandles(),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: RaisedButton(
                    onPressed: () {},
                    color: HexColor('#d91f2a'),
                    child: Text(
                      'Save Changes',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
    }
  }
}
