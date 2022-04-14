import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  String _eMail;
  String _password;
  String _confirmPassword;
  bool _isEmailAvailable = true;
  bool _completed = false;
  bool _isLoading = false;
  bool _isSignedIn = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        accentColor: Colors.white,
        errorColor: Colors.red,
      ),
      child: WillPopScope(
        onWillPop: () {
          Navigator.pop(context, false);
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Registration",
              style: GoogleFonts.staatliches(
                textStyle: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          body: _isLoading
              ? Container(
                  color: Colors.black,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                  width: double.infinity,
                )
              : Center(
                  child: Container(
                    color: Colors.black,
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListView(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                "MK FITNESS",
                                style: GoogleFonts.russoOne(
                                  textStyle: TextStyle(
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                hintText: "abc@def.com",
                                labelText: "E-mail",
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              validator: (String enteredValue) =>
                                  _checkEmail(enteredValue),
                              onSaved: (enteredValue) => _eMail = enteredValue,
                            ),
                            SizedBox(height: 20),
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
                              onSaved: (enteredValue) => _password = enteredValue,
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                hintText: "password",
                                labelText: "Confirm Password",
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onSaved: (enteredValue) =>
                                  _confirmPassword = enteredValue,
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                elevation: MaterialStateProperty.all(10),
                              ),
                              onPressed: _allowedSignup,
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
                    ),
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
    }
    if (!_isEmailAvailable) {
      _isEmailAvailable = true;
      return "This e-mail has been already using by someone else";
    }

    return null;
  }

  void _allowedSignup() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      if (_confirmPassword == _password) {
        setState(() {
          _isLoading = true;
        });
        try {
          UserCredential _userCredential =
              await _auth.createUserWithEmailAndPassword(
                  email: _eMail, password: _password);


          User _user = _userCredential.user;

          await _user.sendEmailVerification();

          _completed = true;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'email-already-in-use') {
            _isEmailAvailable = false;
            formKey.currentState.validate();
          }
          debugPrint(e.toString());
        }
      } else {
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
                              "The passwords do not match",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          elevation: MaterialStateProperty.all(10),
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

      if (_completed) {
        debugPrint("Saved e-Mail: $_eMail");
        debugPrint("Saved password: $_password");

        Navigator.pop(context, true);
      }
    }
  }
}
