import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(
                          'https://c0.wallpaperflare.com/preview/690/183/611/code-coding-connection-css.jpg'),
                      fit: BoxFit.cover,
                    )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 120.0, top: 200),
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 75,
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 150.0, top: 370),
                      child: Text('Sahil Potdukhe')),
                  Divider(
                    indent: 75,
                    endIndent: 75,
                    thickness: 2,
                    color: Colors.amber,
                    height: 800,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 400),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text("Name"),
                          subtitle: Text("Sahil Potdukhe"),
                          leading: Icon(Icons.account_circle),
                        ),
                        ListTile(
                          title: Text(
                            "Email",
                            textDirection: TextDirection.rtl,
                          ),
                          subtitle: Text(
                            "sahilpotdukhe@gmail.com",
                            textDirection: TextDirection.rtl,
                          ),
                          trailing: Icon(Icons.email),
                        ),
                        ListTile(
                          title: Text("Contact"),
                          subtitle: Text("7447332348"),
                          leading: Icon(Icons.phone),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: EdgeInsets.only(left: 1, right: 1, top: 650),
                      width: double.infinity,
                      // height: 280.0,
                      decoration: BoxDecoration(
                          color: Colors.teal[200],
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0.0, 3.0),
                                blurRadius: 5.0)
                          ]),

                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "History",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {},
                                      child: new CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: NetworkImage(
                                            'https://o.remove.bg/downloads/f2986e74-5a1c-4a6f-8c96-b10d3bc9f0f0/1086.10-coins-icon-iconbunny-removebg-preview.png'),
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('300',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500)),
                                    Text('Coins',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {},
                                      child: new CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: NetworkImage(
                                            'https://o.remove.bg/downloads/f520261c-fb63-405e-be48-668aba43da13/a2b88dae-79b5-496b-a53b-6a3e81eb99c7-removebg-preview.png'),
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('25',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500)),
                                    Text('Contest',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {},
                                      child: new CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: NetworkImage(
                                            'https://o.remove.bg/downloads/ed5ac9c3-fe8b-4361-b85f-e7db12d07b15/pngtree-first-prize-gold-trophy-icon-prize-gold-trophy-winner-first-prize-png-image_1908592-removebg-preview.png'),
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('20',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500)),
                                    Text('Wins',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.0),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    indent: 75,
                    endIndent: 75,
                    thickness: 2,
                    color: Colors.amber,
                    height: 1770,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        margin: EdgeInsets.only(left: 1, right: 1, top: 900),
                        // width: double.infinity,
                        height: 200.0,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(225, 217, 254, 1),
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Text('Handles',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('CodeChef',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('abhisheksahu1234',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('Verify',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(
                                    width: 40,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('CodeForces',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('abhisheksahu1234',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('Verify',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(
                                    width: 40,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('CodeChef',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('abhisheksahu1234',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('Verify',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(
                                    width: 40,
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                  Divider(
                    indent: 75,
                    endIndent: 75,
                    thickness: 2,
                    color: Colors.amber,
                    height: 2270,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: EdgeInsets.only(left: 1, right: 1, top: 1150),
                      width: double.infinity,
                      // height: 280.0,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(249, 225, 213, 1),
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),

                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(17.0),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: new CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: NetworkImage(
                                            'https://o.remove.bg/downloads/bd8a8cc1-e631-4ca6-aae0-2fc8b621d0eb/pngtree-vector-location-icon-png-image_317888-removebg-preview.png'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(height: 8.0),
                                  Text('City',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  Text('Allahabad',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500)),
                                  Text('State',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  Text('Uttar Pradesh',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500)),
                                  Text('Country',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  Text('India',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    indent: 75,
                    endIndent: 75,
                    thickness: 2,
                    color: Colors.amber,
                    height: 2650,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: EdgeInsets.only(left: 1, right: 1, top: 1340),
                      width: double.infinity,
                      //height: 280.0,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(211, 249, 200, 1),
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0.0, 3.0),
                                blurRadius: 5.0)
                          ]),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 5,
                          ),
                          ListTile(
                            title: Text("Student/Professional"),
                            subtitle: Text("Student"),
                            trailing: Icon(Icons.computer),
                          ),
                          ListTile(
                            title: Text("Institution"),
                            subtitle: Text(
                                "Indian Institute of Information Technology, Vadodara"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
