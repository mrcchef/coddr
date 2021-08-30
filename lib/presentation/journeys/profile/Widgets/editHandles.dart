import 'package:flutter/material.dart';

class Pedithandles extends StatefulWidget {
  const Pedithandles({Key key}) : super(key: key);

  @override
  _PedithandlesState createState() => _PedithandlesState();
}

class _PedithandlesState extends State<Pedithandles> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(
                'Edit handles',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
              )),
          SizedBox(height: 25,),
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
                      hintStyle: TextStyle(fontSize: 14)
                  ),
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
          SizedBox(height: 30,),
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
                      hintStyle: TextStyle(fontSize: 14)
                  ),
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
          SizedBox(height: 30,),
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
                      hintStyle: TextStyle(fontSize: 14)
                  ),
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
    );
  }
}
