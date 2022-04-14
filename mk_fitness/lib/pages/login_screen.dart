import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String _eMail, _password;
  bool autoControl = false;
  bool _completed = false;
  bool _acceptGoogleSign;

  bool _isLoading = false;

  final formKey = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Let's Start !",
          style: GoogleFonts.staatliches(
            textStyle: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: _isLoading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
              width: double.infinity,
              color: Colors.black,
            )
          : Center(
              child: Container(
                width: double.infinity,
                color: Colors.black,
                padding: EdgeInsets.all(15),
                child: Form(
                  key: formKey,
                  autovalidateMode: autoControl
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  child: ListView(
                    children: [
                      SizedBox(height: 60),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "MK FITNESS",
                              style: GoogleFonts.russoOne(
                                textStyle: TextStyle(
                                  fontSize: 35,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Column(
                            children: <Widget>[
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  hintText: "abcd@xyz.com",
                                  labelText: "E-Mail",
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                validator: (String enteredValue) =>
                                    _checkEmail(enteredValue),
                                onSaved: (enteredValue) =>
                                    _eMail = enteredValue,
                                //initialValue: "SSSS",
                              ),
                              SizedBox(height: 30),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  hintText: "password",
                                  labelText: "Password",
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                validator: (String enteredValue) {
                                  if (enteredValue.length < 6) {
                                    return "Minimum 6 character required";
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (enteredValue) =>
                                    _password = enteredValue,
                              ),
                              GestureDetector(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "I forgot my password",
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: _forgotPassword,
                              )
                            ],
                          ),
                          SizedBox(height: 50),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                ElevatedButton(
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(10),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                  ),
                                  onPressed: _allowedSignIn,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Sign In",
                                        style: GoogleFonts.anton(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.login,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        height: 1,
                                        width: 120,
                                        color: Colors.white,
                                        child: Text("."),
                                      ),
                                      Text(
                                        "OR",
                                        style: GoogleFonts.staatliches(
                                          textStyle: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        height: 1,
                                        width: 120,
                                        color: Colors.white,
                                        child: Text("."),
                                      ),
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(10),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                  ),
                                  onPressed: () async {
                                    await _signInWithGoogle();
                                    if (_acceptGoogleSign) {
                                      setState(() {
                                        _isLoading = true;
                                      });
                                      try {
                                        QuerySnapshot _querySnap =
                                            await _firestore
                                                .collection('users')
                                                .where('e-mail',
                                                    isEqualTo:
                                                        _auth.currentUser.email)
                                                .get();

                                        var document;

                                        for (var doc in _querySnap.docs) {
                                          document = doc;
                                        }

                                        if (_querySnap.docs.length != 0) {
                                          if (document.get('info-entered')) {
                                            Navigator.pushReplacementNamed(
                                                context, "/main_screen");
                                          } else {
                                            Navigator.pushReplacementNamed(
                                                context, "/user_info");
                                          }
                                        } else {
                                          Navigator.pushReplacementNamed(
                                              context, "/user_info");
                                        }
                                      } catch (e) {
                                        setState(() {
                                          _isLoading = false;
                                        });
                                      }
                                    } else {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Image.asset(
                                          "assets/images/google.png",
                                        ),
                                        width: 30,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Sign In With Google",
                                        style: GoogleFonts.anton(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 40),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "You don't have an account ? Join Us!",
                                    style: GoogleFonts.staatliches(
                                      textStyle: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(10),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                  ),
                                  onPressed: _signUp,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Sign Up",
                                        style: GoogleFonts.anton(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.group_add,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  String _checkEmail(String value) {
    //Taken from internet
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return "Invalid E-Mail..";
    } else {
      return null;
    }
  }

  void _allowedSignIn() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      setState(() {
        _isLoading = true;
      });

      try {
        UserCredential _userCredential = await _auth.signInWithEmailAndPassword(
            email: _eMail, password: _password);

        User _user = _userCredential.user;

        if (_user.emailVerified) {
          _completed = true;
        } else {
          await _auth.signOut();
          verifyEmailMessage();
          setState(() {
            _isLoading = false;
          });
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == "user-not-found" || e.code == "wrong-password") {
          setState(() {
            _isLoading = false;
          });
          failedSignInMessage();
        }
        debugPrint(e.code);
        debugPrint(e.toString());
      }

      if (_completed) {
        debugPrint("Logged User e-Mail: $_eMail");
        debugPrint("Logged User password: $_password");

        QuerySnapshot _querySnap = await _firestore
            .collection('users')
            .where('e-mail', isEqualTo: _auth.currentUser.email)
            .get();

        try {
          var document;

          for (var doc in _querySnap.docs) {
            document = doc;
          }

          if (document.get('info-entered')) {
            Navigator.pushReplacementNamed(context, "/main_screen");
          } else {
            Navigator.pushReplacementNamed(context, "/user_info");
          }
        } catch (e) {
          Navigator.pushReplacementNamed(context, "/user_info");
        }
      }
    } else {
      setState(() {
        autoControl = true;
      });
    }
  }

  Future<UserCredential> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      setState(() {
        _acceptGoogleSign = true;
        _isLoading = true;
      });

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _forgotPassword() {
    Navigator.pushNamed(context, "/forgot_password_screen").then(
      (value) async {
        if (value) {
          await showDialog(
            context: context,
            barrierColor: Colors.black,
            builder: (context) {
              return Scaffold(
                body: Center(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.verified,
                          size: 70,
                          color: Colors.green,
                        ),
                        Column(
                          children: [
                            Container(
                              child: Text(
                                "We sent a password reset e-mail to your e-mail.",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              child: Text(
                                "Check your e-mail and reset your password by the instructions.",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              child: Text(
                                "When you reset your password, you can sign in by your new password.",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(10),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Okay",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.verified_outlined,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  void _signUp() {
    try {
      Navigator.pushNamed(context, "/signup_screen").then((value) async {
        if (value) {
          await showDialog(
            context: context,
            barrierColor: Colors.black,
            builder: (context) {
              return Scaffold(
                body: Center(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.verified,
                          size: 70,
                          color: Colors.green,
                        ),
                        Column(
                          children: [
                            Container(
                              child: Text(
                                "You signed up successfully.",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              child: Text(
                                "We have sent an e-mail for verification to your e-mail.",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              child: Text(
                                "You can sign in after you verified your e-mail.",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(10),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Okay",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.verified_outlined,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void verifyEmailMessage() async {
    await showDialog(
      context: context,
      barrierColor: Colors.black,
      builder: (context) {
        return Scaffold(
          body: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.warning,
                    size: 70,
                    color: Colors.red,
                  ),
                  Column(
                    children: [
                      Container(
                        child: Text(
                          "We have sent an e-mail for verification to your e-mail.",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Text(
                          "Please verify your e-mail first.",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Text(
                          "You can sign in after you verified your e-mail.",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(10),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Okay",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.verified_outlined,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void failedSignInMessage() async {
    await showDialog(
      context: context,
      barrierColor: Colors.black,
      builder: (context) {
        return Scaffold(
          body: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.warning,
                    size: 70,
                    color: Colors.red,
                  ),
                  Column(
                    children: [
                      Container(
                        child: Text(
                          "The user cannot found",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Text(
                          "OR",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Text(
                          "The e-mail or password is not true",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Text(
                          "If you did't verified your e-mail, ",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "please verify your e-mail first.",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(10),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Try Again",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.repeat,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
