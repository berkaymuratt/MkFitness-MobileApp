import 'package:flutter/material.dart';
import 'package:mobile_app/pages/diet.dart';
import 'package:mobile_app/pages/forgot_password_screen.dart';
import 'package:mobile_app/pages/full_body.dart';
import 'package:mobile_app/pages/glutes.dart';
import 'package:mobile_app/pages/loading_screen.dart';
import 'package:mobile_app/pages/login_screen.dart';
import 'package:mobile_app/pages/main_screen.dart';
import 'package:mobile_app/pages/my_statistics.dart';
import 'package:mobile_app/pages/online_coaching.dart';
import 'package:mobile_app/pages/profile_screen.dart';
import 'package:mobile_app/pages/push_pull_legs.dart';
import 'package:mobile_app/pages/settings_screen.dart';
import 'package:mobile_app/pages/signup_screen.dart';
import 'package:mobile_app/pages/user_info.dart';
import 'package:mobile_app/pages/welcome_screen_1.dart';
import 'package:mobile_app/pages/workouts.dart';

import 'firebase_connection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.white,
        errorColor: Colors.red,
      ),
      initialRoute: "/firebase_connection",
      routes: {
        "/firebase_connection" : (context) => FirebaseConnection(),
        "/loading_screen" : (context) => LoadingScreen(),
        "/welcome_screen1": (context) => WelcomeScreen1(),
        "/login_screen": (context) => LogInScreen(),
        "/forgot_password_screen" : (context) => ForgotPasswordScreen(),
        "/signup_screen" : (context) => SignupScreen(),
        "/user_info": (context) => UserInfo(),
        "/login_screen/user_info": (context) => UserInfo(),
        "/firebase_connection/user_info" : (context) => UserInfo(),
        "/main_screen" : (context) => MainPage(),
        "/user_info/main_screen": (context) => MainPage(),
        "/login_screen/user_info/main_screen" : (context) => MainPage(),
        "/profile_screen" : (context) => ProfileScreen(),
        "/settings_screen" : (context) => SettingsScreen(),
        "/workouts" : (context) => Workouts(),
        "/full_body_workout" : (context) => FullBody(),
        "/push_pull_legs_workout" : (context) => PushPullLegs(),
        "/glutes_workout" : (context) => Glutes(),
        "/diet" : (context) => Diet(),
        "/my_statistics" : (context) => MyStatistics(),
        "/online_coaching" : (context) => OnlineCoaching(),
      },
    );
  }
}
