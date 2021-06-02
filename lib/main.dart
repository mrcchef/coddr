import 'package:coddr/presentation/journeys/auth/sign_in_screen.dart';
import 'package:coddr/presentation/journeys/auth/sign_up_screen.dart';
import 'package:coddr/presentation/journeys/upcoming_contests/upcoming_contests_screen.dart';
import 'package:coddr/presentation/themes/themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';

//Files
import 'package:coddr/presentation/journeys/home/home_screen.dart';
import 'package:coddr/dependencies/get_it.dart' as get_it;
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        //home: SignIn(),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (ctx, userSnapshot) {
              if (userSnapshot.hasData) {
                return HomeScreen();
              }
              return SignIn();
            }),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          SignIn.routeName: (ctx) => SignIn(),
          SignUp.routeName: (ctx) => SignUp(),
          UpcomingContestsScreen.routeName: (ctx) => UpcomingContestsScreen(),
        });
  }
}
