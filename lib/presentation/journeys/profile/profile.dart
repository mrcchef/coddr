import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

enum Page { accountinfo, editinfo }

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Page _selectedPage = Page.accountinfo;
  GlobalKey<FormState> _formkey = GlobalKey();
  String stpr = 'Student';

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
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 190,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/coding.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 56,
                      )
                    ],
                  ),
                  Positioned(
                    top: 125,
                    right: 135,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          AssetImage('assets/images/kshittiz2.jpg'),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Divider(
                thickness: 2.5,
              ),
              Column(
                children: [
                  ListTile(
                    title: Text(
                      "Name",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: HexColor('0B2FB0')),
                    ),
                    subtitle: Text(
                      "Sahil Potdukhe",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    leading: CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage('assets/images/img.png'),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Contact",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: HexColor('0B2FB0')),
                      textDirection: TextDirection.rtl,
                    ),
                    subtitle: Text(
                      "7447332096",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      textDirection: TextDirection.rtl,
                    ),
                    trailing: CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage('assets/images/img_2.png'),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Email",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: HexColor('0B2FB0')),
                    ),
                    subtitle: Text(
                      "sahilpotdukhe@gmail.com",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    leading: CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage('assets/images/img_1.png'),
                    ),
                    trailing: TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        'Verify',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      icon: Icon(
                        FontAwesomeIcons.questionCircle,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 2.5,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: HexColor('D8FFCE'),
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'History',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/coins.png',
                                height: 50,
                                width: 50,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                '300',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Text(
                                'Coins',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Container(
                                height: 70,
                                width: 100,
                                child: Image.asset(
                                  'assets/images/contest.png',
                                ),
                              ),
                              Text(
                                '25',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Text(
                                'Contest',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/trophy.png',
                                height: 50,
                                width: 50,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                '20',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Text(
                                'Wins',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 2.5,
              ),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: HexColor('FDD9D9'),
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 0),
                          child: Text(
                            'Handles',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                        ListTile(
                          minVerticalPadding: 0,
                          title: Text(
                            "CodeForces",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: HexColor('0B2FB0')),
                          ),
                          subtitle: Text(
                            "sahilpotdukhe11",
                            style: TextStyle(color: Colors.black),
                          ),
                          trailing: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.checkCircle,
                                color: Colors.green,
                                size: 20,
                              ),
                              label: Text(
                                'Verified',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        ListTile(
                          minVerticalPadding: 0,
                          title: Text(
                            "CodeChef",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: HexColor('0B2FB0')),
                          ),
                          subtitle: Text(
                            "sahilpotdukhe123",
                            style: TextStyle(color: Colors.black),
                          ),
                          trailing: TextButton.icon(
                            onPressed: () {},
                            label: Text(
                              'Verify',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            icon: Icon(
                              FontAwesomeIcons.questionCircle,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "HackerEarth",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: HexColor('0B2FB0')),
                          ),
                          subtitle: Text(
                            "sahilpotdukhe142",
                            style: TextStyle(color: Colors.black),
                          ),
                          trailing: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.checkCircle,
                                color: Colors.green,
                                size: 20,
                              ),
                              label: Text(
                                'Verified',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ],
                    ),
                  )),
              Divider(
                thickness: 2.5,
              ),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                        color: HexColor('E1D9FE'),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Icon(
                            FontAwesomeIcons.mapMarkerAlt,
                            size: 50,
                          ),
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'City',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: HexColor('861F3E'),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 52,
                                ),
                                Text('Allahabad')
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'State',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: HexColor('861F3E'),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 42,
                                ),
                                Text('Uttar Pradesh')
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Country',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: HexColor('861F3E'),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text('India')
                              ],
                            ),
                          ],
                        ),
                        Spacer()
                      ],
                    ),
                  )),
              Divider(
                thickness: 2.5,
              ),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: HexColor('FDE5D9'),
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Student/Professional',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('Student'),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8.0, 20, 10, 10),
                                child: Icon(FontAwesomeIcons.laptop),
                              ),
                              SizedBox(
                                width: 30,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 5),
                            child: Text('Institution',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 5),
                            child: Text(
                                'Indian Institute of Information Technology Vadodara'),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      )))
            ],
          ),
        );

      case Page.editinfo:
        TextEditingController namecontroller = TextEditingController();
        TextEditingController phonecontroller = TextEditingController();
        TextEditingController institutecontroller = TextEditingController();

        return Scaffold(
          body: Form(
            key: _formkey,
            child: ListView(
              children: [
                SizedBox(
                  height: 25,
                ),
                Center(
                    child: InkWell(
                  child: Stack(
                    children: [
                      Container(
                        child: CircleAvatar(
                          radius: 60.0,
                          backgroundImage:
                              AssetImage('assets/images/kshittiz2.jpg'),
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
                            child: Center(
                                child: Text(
                              'Edit',
                              style: TextStyle(color: Colors.white),
                            ))),
                      )
                    ],
                  ),
                )),
                SizedBox(
                  height: 25,
                ),
                Padding(
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
                        ),
                      ),
                      SizedBox(
                        height: 33,
                      ),
                      Row(
                        children: [
                          Text('Student/Profession',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black)),
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
                                value: stpr,
                                dropdownColor: Colors.grey,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                                icon: Icon(Icons.arrow_drop_down),
                                iconEnabledColor: Colors.black,
                                onChanged: (newvalue) {
                                  setState(() {
                                    stpr = newvalue;
                                  });
                                },
                                items: <String>[
                                  'Student',
                                  'Profession'
                                ].map<DropdownMenuItem<String>>((String value) {
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
                      Center(
                          child: Text(
                        'Edit handles',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
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
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Name';
                                }
                                return null;
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
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
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
