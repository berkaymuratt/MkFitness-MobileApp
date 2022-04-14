import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/pages/loading_screen.dart';
import 'package:mobile_app/pages/main_screen.dart';
import 'package:mobile_app/pages/user_info.dart';
import 'pages/welcome_screen_1.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseConnection extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error has occured: " + snapshot.error.toString()),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {

          if (FirebaseAuth.instance.currentUser == null) {
            return WelcomeScreen1();
          } else {
            return MainPage();
          }
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(
          body: Center(
            child: LoadingScreen(),
          ),
        );
      },
    );
  }
}
