import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _isLoading = true;
  bool _acceptGoogleSign = false;

  Map<String, dynamic> _userMap;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    DocumentReference _userRef =
        _firestore.collection('users').doc(_auth.currentUser.uid);

    DocumentSnapshot _docSnap = await _userRef.get();

    setState(() {
      _userMap = {
        'e-mail': _docSnap.get('e-mail'),
      };
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "SETTINGS",
          style: GoogleFonts.bigShouldersDisplay(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : ListView(
                children: [
                  Container(
                    height: 60,
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.account_circle),
                            SizedBox(width: 10),
                            Text(
                              'E-mail :',
                              style: GoogleFonts.staatliches(
                                textStyle: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          _userMap['e-mail'],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 3),
                  GestureDetector(
                    child: Container(
                      height: 60,
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.vpn_key),
                              SizedBox(width: 10),
                              Text(
                                'Update Password',
                                style: GoogleFonts.staatliches(
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdatePassword()))
                          .then((value) async {
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                                "Your password updated successfully.",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            elevation:
                                                MaterialStateProperty.all(10),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white),
                                          ),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                    },
                  ),
                  Divider(thickness: 3),
                  GestureDetector(
                    child: Container(
                      height: 60,
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Image.asset(
                                  "assets/images/google.png",
                                ),
                                width: 25,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Connect with your Google Account',
                                style: GoogleFonts.staatliches(
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                    onTap: () async {
                      if (_auth.currentUser.email.indexOf('gmail') != -1) {
                        await _signInWithGoogle();
                        if (_acceptGoogleSign) {
                          setState(() {
                            _isLoading = false;
                          });
                          _successfulGoogle();
                        } else {
                          setState(() {
                            _isLoading = false;
                          });
                        }
                      } else {
                        _showMailMessage();
                      }
                    },
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "Note: You can connect your google account only if you use same e-mail in gmail as e-mail in this account.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(thickness: 3),
                ],
              ),
      ),
    );
  }

  void _showMailMessage() async {
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
                          "Warning: Your mail is not belong any gmail account..",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(10),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Back",
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

      if(googleUser.email == _auth.currentUser.email) {
        return await FirebaseAuth.instance.signInWithCredential(credential);
      } else {
        setState(() {
          _acceptGoogleSign = false;
        });
        return null;
      }
    } catch (e) {
      setState(() {
        _acceptGoogleSign = false;
        _isLoading = false;
      });
    }
  }

  void _successfulGoogle() async {
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
                    Icons.done_all,
                    size: 70,
                    color: Colors.green,
                  ),
                  Container(
                    child: Text(
                      "Connected successfully !",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                          "Done",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.done_rounded,
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

class UpdatePassword extends StatefulWidget {
  @override
  _UpdatePasswordState createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  String _currentPassword, _newPassword, _confirmNewPassword;

  bool _isLoading = false;

  bool _completed = false;

  final _formKey = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Update Password",
            style: GoogleFonts.staatliches(
              textStyle: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: _isLoading
              ? CircularProgressIndicator()
              : Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                hintText: "password",
                                labelText: "Current Password",
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
                              onSaved: (enteredValue) {
                                setState(() {
                                  _currentPassword = enteredValue;
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                hintText: "password",
                                labelText: "New Password",
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
                              onSaved: (enteredValue) {
                                setState(() {
                                  _newPassword = enteredValue;
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                hintText: "password",
                                labelText: "Confirm New Password",
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onSaved: (enteredValue) {
                                setState(() {
                                  _confirmNewPassword = enteredValue;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: ElevatedButton(
                          onPressed: _allowUpdate,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Update',
                                style: GoogleFonts.staatliches(
                                  textStyle: TextStyle(
                                    fontSize: 23,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.system_update,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  void _allowUpdate() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      if (_confirmNewPassword == _newPassword) {
        setState(() {
          _isLoading = true;
        });
        try {
          await _auth.currentUser.updatePassword(_newPassword);

          _completed = true;
        } on FirebaseAuthException catch (e) {
          try {
            String email = _auth.currentUser.email;
            String password = _currentPassword;

            EmailAuthCredential credential =
                EmailAuthProvider.credential(email: email, password: password);

            await _auth.currentUser.reauthenticateWithCredential(credential);

            await _auth.currentUser.updatePassword(_newPassword);

            debugPrint("Password is updated by reauthenticate...");

            _completed = true;
          } catch (e) {
            setState(() {
              _isLoading = false;
            });
            _checkOldPasswordMessage();
          }
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
        setState(() {
          _isLoading = false;
        });
      }

      if (_completed) {
        Navigator.pop(context, true);
      }
    }
  }

  void _checkOldPasswordMessage() async {
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
                          "Your current password may be wrong,",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Please try again..",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
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
}
