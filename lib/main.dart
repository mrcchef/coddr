import 'package:coddr/domain/usecases/get_cf_contest_list.dart';
import 'package:coddr/presentation/journeys/home/sign_in.dart';
import 'package:coddr/presentation/journeys/home/sign_up.dart';
import 'package:coddr/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';

//Files
import 'package:coddr/presentation/journeys/home/home_screen.dart';
import 'package:coddr/dependencies/get_it.dart' as get_it;

import 'domain/entities/no_params.dart';

void main() async {
  unawaited(get_it.init());
  GetCFContestList getCFContestList = get_it.getItInstacne<GetCFContestList>();
  final list = await getCFContestList(NoParams());
  print(list);
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
        //home: HomeScreen(),
        home: SignIn(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          SignIn.routeName: (ctx) => SignIn(),
          SignUp.routeName: (ctx) => SignUp(),
        });
  }
}
