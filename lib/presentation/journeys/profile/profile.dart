import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  backgroundImage: AssetImage('assets/images/kshittiz2.jpg'),
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
                  "Email",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: HexColor('0B2FB0')),
                  textDirection: TextDirection.rtl,
                ),
                subtitle: Text(
                  "sahilpotdukhe@gmail.com",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                  textDirection: TextDirection.rtl,
                ),
                trailing: CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage('assets/images/img_1.png'),
                ),
              ),
              ListTile(
                title: Text(
                  "Contact",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: HexColor('0B2FB0')),
                ),
                subtitle: Text("7447332096",
                    style: TextStyle(fontSize: 12, color: Colors.black)),
                leading: CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage('assets/images/img_2.png'),
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
                            style: TextStyle(fontSize: 14, color: Colors.black),
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
                            style: TextStyle(fontSize: 14, color: Colors.black),
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
                            style: TextStyle(fontSize: 14, color: Colors.black),
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
                      trailing:
                        Image.asset('assets/images/verified.png',width: 90,)
                      // Text(
                      //   "Verified",
                      //   style: TextStyle(
                      //       color: Colors.green, fontWeight: FontWeight.bold),
                      // ),
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
                      trailing: Text(
                        "Verify",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
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
                      trailing: Text(
                        "Verify",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
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
                child:Column(
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
                              Text('Student/Professional' ,style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),),
                              Text('Student'),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0,20,10,10),
                          child: Icon(FontAwesomeIcons.laptop),
                        ),
                        SizedBox(width: 30,)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0,0,0,5),
                      child: Text('Institution',style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0,0,0,5),
                      child: Text('Indian Institute of Information Technology Vadodara'),
                    ),
                    SizedBox(height: 10,)

                  ],
                )
              ))
        ],
      ),
    );
  }
}
