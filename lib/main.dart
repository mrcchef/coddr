import 'package:coddr/dependencies/get_it.dart' as get_it;
import 'package:coddr/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:coddr/presentation/blocs/contest_standings/contest_standings_bloc.dart';
import 'package:coddr/presentation/blocs/create_curated_contest/create_curated_contest_bloc.dart';
import 'package:coddr/presentation/blocs/curated_contest/curated_contest_bloc.dart';
import 'package:coddr/presentation/blocs/email_verification/email_verification_bloc.dart';
import 'package:coddr/presentation/blocs/handel_verification/handel_verification_bloc.dart';
import 'package:coddr/presentation/blocs/participated_contest/participated_contest_bloc.dart';
import 'package:coddr/presentation/blocs/profile/profile_bloc.dart';
import 'package:coddr/presentation/blocs/send_verification_email/send_verification_email_bloc.dart';
import 'package:coddr/presentation/blocs/signIn/signin_bloc.dart';
import 'package:coddr/presentation/blocs/signup/signup_bloc.dart';
import 'package:coddr/presentation/blocs/update_curated_contest/update_curated_contest_bloc.dart';
import 'package:coddr/presentation/journeys/RankList/WebViewPage.dart';
import 'package:coddr/presentation/journeys/auth/complete_profile.dart';
import 'package:coddr/presentation/journeys/auth/sign_in_screen.dart';
import 'package:coddr/presentation/journeys/auth/sign_up_screen.dart';
import 'package:coddr/presentation/journeys/auth/splash_screen.dart';
import 'package:coddr/presentation/journeys/auth/verify_email_sceen.dart';
//Files
import 'package:coddr/presentation/journeys/home/home_screen.dart';
import 'package:coddr/presentation/journeys/profile/edit_profile.dart';
import 'package:coddr/presentation/journeys/profile/profile.dart';
import 'package:coddr/presentation/journeys/upcoming_contests/upcoming_contests_screen.dart';
import 'package:coddr/presentation/themes/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedantic/pedantic.dart';

import 'presentation/journeys/about_us/about_us.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  unawaited(get_it.init());
  runApp(MyApp());
}

//MyApp
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthenticationBloc _authenticationBloc;
  SignInBloc _signInBloc;
  SignUpBloc _signUpBloc;
  ProfileBloc _profileBloc;
  EmailVerificationBloc _emailVerificationBloc;
  SendVerificationEmailBloc _sendVerificationEmailBloc;
  HandelVerificationBloc _handelVerificationBloc;
  ContestStandingsBloc _contestStandingsBloc;
  CuratedContestBloc _curatedContestBloc;
  CreateCuratedContestBloc _createCuratedContestBloc;
  UpdateCuratedContestBloc _updateCuratedContestBloc;
  ParticipatedContestBloc _participatedContestBloc;

  @override
  void initState() {
    _authenticationBloc = get_it.getItInstance<AuthenticationBloc>();
    _authenticationBloc.add(AppStartedEvent());
    _signInBloc = get_it.getItInstance<SignInBloc>();
    _signUpBloc = get_it.getItInstance<SignUpBloc>();
    _profileBloc = get_it.getItInstance<ProfileBloc>();
    _emailVerificationBloc = get_it.getItInstance<EmailVerificationBloc>();
    _sendVerificationEmailBloc =
        get_it.getItInstance<SendVerificationEmailBloc>();
    _handelVerificationBloc = get_it.getItInstance<HandelVerificationBloc>();
    _contestStandingsBloc = get_it.getItInstance<ContestStandingsBloc>();
    _curatedContestBloc = get_it.getItInstance<CuratedContestBloc>();
    _createCuratedContestBloc =
        get_it.getItInstance<CreateCuratedContestBloc>();
    _updateCuratedContestBloc =
        get_it.getItInstance<UpdateCuratedContestBloc>();
    _participatedContestBloc = get_it.getItInstance<ParticipatedContestBloc>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _authenticationBloc.close();
    _signInBloc.close();
    _signUpBloc.close();
    _profileBloc.close();
    _emailVerificationBloc.close();
    _sendVerificationEmailBloc.close();
    _handelVerificationBloc.close();
    _contestStandingsBloc.close();
    _curatedContestBloc.close();
    _createCuratedContestBloc.close();
    _updateCuratedContestBloc.close();
    _participatedContestBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => _authenticationBloc,
        ),
        BlocProvider<SignInBloc>(
          create: (context) => _signInBloc,
        ),
        BlocProvider<SignUpBloc>(
          create: (context) => _signUpBloc,
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => _profileBloc,
        ),
        BlocProvider<EmailVerificationBloc>(
            create: (context) => _emailVerificationBloc),
        BlocProvider<SendVerificationEmailBloc>(
            create: (context) => _sendVerificationEmailBloc),
        BlocProvider<HandelVerificationBloc>(
            create: (context) => _handelVerificationBloc),
        BlocProvider<ContestStandingsBloc>(
            create: (context) => _contestStandingsBloc),
        BlocProvider<CuratedContestBloc>(
            create: (context) => _curatedContestBloc),
        BlocProvider<CreateCuratedContestBloc>(
            create: (context) => _createCuratedContestBloc),
        BlocProvider<UpdateCuratedContestBloc>(
            create: (context) => _updateCuratedContestBloc),
        BlocProvider<ParticipatedContestBloc>(
            create: (context) => _participatedContestBloc),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Coddr',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: ThemeText.getTextTheme(),
          ),
          home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            bloc: _authenticationBloc,
            builder: (context, state) {
              if (state is AuthenticationInitial) {
                print("AppStarted");
                return SplashScreen();
              } else if (state is Authenticated) {
                // print(state.email);
                print("State is Authenticated");
                // return CompleteProfile();
                return HomeScreen();
              } else {
                print("State is Unauthenticated");
                return SignInScreen();
              }
            },
          ),
          routes: {
            HomeScreen.routeName: (ctx) => HomeScreen(),
            Profile.routeName: (ctx) => Profile(),
            EditProfile.routeName: (ctx) => EditProfile(),
            SignInScreen.routeName: (ctx) => SignInScreen(),
            SignUpScreen.routeName: (ctx) => SignUpScreen(),
            UpcomingContestsScreen.routeName: (ctx) => UpcomingContestsScreen(),
            WebViewPage.routeName: (ctx) => WebViewPage(),
            AboutUs.routeName: (ctx) => AboutUs(),
            VerifyEmailScreen.routeName: (ctx) => VerifyEmailScreen(),
            CompleteProfile.routeName: (ctx) => CompleteProfile(),
          }),
    );
  }
}
