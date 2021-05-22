import 'package:coddr/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';

//Files
import 'package:coddr/presentation/journeys/home/home_screen.dart';
import 'package:coddr/dependencies/get_it.dart' as get_it;

void main() {
  unawaited(get_it.init());
  runApp(MyApp());
}

//MyApp 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coddr',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: ThemeText.getTextTheme(),
      ),
      home: HomeScreen(),
    );
  }
}
