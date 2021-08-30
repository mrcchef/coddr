import 'package:flutter/material.dart';
class PEditDetails extends StatefulWidget {
  const PEditDetails({Key key}) : super(key: key);

  @override
  _PEditDetailsState createState() => _PEditDetailsState();
}

class _PEditDetailsState extends State<PEditDetails> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController institutecontroller = TextEditingController();
  String stpr = 'Student';

  @override
  Widget build(BuildContext context) {
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
                        style: TextStyle(color: Colors.black, fontSize: 14),
                        icon: Icon(Icons.arrow_drop_down),
                        iconEnabledColor: Colors.black,
                        onChanged: (newvalue) {
                          setState(() {
                            stpr = newvalue;
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
}
