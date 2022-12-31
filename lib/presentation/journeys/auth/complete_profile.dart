import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompleteProfile extends StatefulWidget {
  static String routeName = "/complete_profile";
  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  @override
  Widget build(Object context) {
    return Scaffold(
      body: Center(
        child: Text("complete profile"),
      ),
    );
  }
}
