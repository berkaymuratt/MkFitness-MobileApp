import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_app/pages/loading_screen.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserInfoScreen(title: "Login Screen"),
    );
  }
}

class UserInfoScreen extends StatefulWidget {
  UserInfoScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  String _option1 = "Gender";
  int _activity;
  final formKey = new GlobalKey<FormState>();
  TextStyle style = TextStyle(fontFamily: "Rockwell", fontSize: 20.0);

  String _name, _surname, _gender;
  int _age, _weight, _goalWeight, _height, _activityValue;

  double _dailyProteinCal, _dailyCarbohydrateCal, _dailyFatCal, _dailyTotalCal;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    String option = "Your daily activity";

    final nameField = TextFormField(
      style: TextStyle(color: Colors.white),
      obscureText: false,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: "Name",
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      validator: (enteredValue) {
        if (enteredValue.length == 0) {
          return "Invalid Name";
        } else {
          return null;
        }
      },
      onSaved: (enteredValue) {
        setState(() {
          _name = enteredValue;
        });
      },
    );

    final surnameField = TextFormField(
      style: TextStyle(color: Colors.white),
      obscureText: false,
      keyboardType: TextInputType.name,
      // style: style,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: "Surname",
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      validator: (enteredValue) {
        if (enteredValue.length == 0) {
          return "Invalid Surname";
        } else {
          return null;
        }
      },
      onSaved: (enteredValue) {
        setState(() {
          _surname = enteredValue;
        });
      },
    );

    final ageField = TextFormField(
      keyboardType: TextInputType.number,
      obscureText: false,
      style: TextStyle(color: Colors.white),
      //style: style,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black,
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Your Age",
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
      validator: (enteredValue) {
        try {
          if (int.parse(enteredValue) < 0 || enteredValue == null) {
            return "Invalid Age";
          } else {
            return null;
          }
        } catch (e) {
          return "Invalid Age";
        }
      },
      onSaved: (enteredValue) {
        setState(() {
          _age = int.parse(enteredValue);
        });
      },
    );

    final currentWeight = TextFormField(
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.white),
      obscureText: false,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: "Current Weight",
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      validator: (enteredValue) {
        try {
          if (int.parse(enteredValue) < 10 ||
              int.parse(enteredValue) > 600 ||
              enteredValue == null) {
            return 'Invalid Weight';
          } else {
            return null;
          }
        } catch (e) {
          return 'Invalid Weight';
        }
      },
      onSaved: (enteredValue) {
        setState(() {
          _weight = int.parse(enteredValue);
        });
      },
    );

    final goalWeight = TextFormField(
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.white),
      obscureText: false,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: "Goal Weight",
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      validator: (enteredValue) {
        try {
          if (int.parse(enteredValue) < 10 ||
              int.parse(enteredValue) > 600 ||
              enteredValue == null) {
            return 'Invalid Weight';
          } else {
            return null;
          }
        } catch (e) {
          return 'Invalid Weight';
        }
      },
      onSaved: (enteredValue) {
        setState(() {
          _goalWeight = int.parse(enteredValue);
        });
      },
    );

    final height = TextFormField(
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.white),
      obscureText: false,
      //style: style,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: "Your height in cms",
          labelStyle: TextStyle(color: Colors.white),
          errorStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      validator: (enteredValue) {
        try {
          if (int.parse(enteredValue) <= 0 || enteredValue == null) {
            return "Invalid Height";
          } else {
            return null;
          }
        } catch (e) {
          return "Invalid Height";
        }
      },
      onSaved: (enteredValue) {
        setState(() {
          _height = int.parse(enteredValue);
        });
      },
    );

    final button = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: 350,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () async {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();

            setState(() {
              _isLoading = true;
            });

            _calcDailyCalorie();

            await _firestore
                .collection('users')
                .doc(_auth.currentUser.uid)
                .set({
              'name': _name,
              'uid': _auth.currentUser.uid,
              'e-mail': _auth.currentUser.email,
              'surname': _surname,
              'age': _age,
              'gender': _gender,
              'weight': _weight,
              'goal_weight': _goalWeight,
              'daily-total-cal-goal': _dailyTotalCal,
              'daily-protein-cal-goal': _dailyProteinCal,
              'daily-carbohydrate-cal-goal': _dailyCarbohydrateCal,
              'daily-fat-cal-goal': _dailyFatCal,
              'height': _height,
              'activity': _activityValue,
              'day': Timestamp.now().toDate().day,
              'month': Timestamp.now().toDate().month,
              'year': Timestamp.now().toDate().year,
              'menu': {},
              'tried-to-find-menu': false,
              'total-calorie-amount': 0.00,
              'protein-calorie-amount': 0.00,
              'carbohydrate-calorie-amount': 0.00,
              'fat-calorie-amount': 0.00,
              'info-entered': true,
            });

            Navigator.pushReplacementNamed(context, "/main_screen");
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Save and Continue",
              textAlign: TextAlign.center,
              style: GoogleFonts.anton(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
            ),
            Icon(
              Icons.save,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );

    final activityOption = DropdownButtonFormField(
      isExpanded: true,
      value: _activity,
      items: [
        DropdownMenuItem(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              "- I am not working out at all",
              style: TextStyle(color: Colors.white),
            ),
          ),
          value: 1,
        ),
        //Divider(color: Colors.black,);
        DropdownMenuItem(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              "- 1-3 days workout in a week.",
              style: TextStyle(color: Colors.white),
            ),
          ),
          value: 2,
        ),
        DropdownMenuItem(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text("- 3-5 days workout in a week.",
                style: TextStyle(color: Colors.white)),
          ),
          value: 3,
        ),
        DropdownMenuItem(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              "- 6-7 days workout in a week.",
              style: TextStyle(color: Colors.white),
            ),
          ),
          value: 4,

          // style :TextStyle(color: Colors.white),
        ),
      ],
      onChanged: (value) {
        setState(() {
          _activity = value;
        });
      },
      style: style,
      decoration: InputDecoration(
        errorStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        filled: true,
        fillColor: Colors.black,
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: option,
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
      validator: (value) {
        if (value == null) {
          return 'Please choose an option...';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _activityValue = value;
      },
    );

    final genderSelection = DropdownButtonFormField(
      //value: option1,
      items: [
        DropdownMenuItem(
          child: Text(
            "Female",
            style: TextStyle(color: Colors.white),
          ),
          value: "Female",
        ),
        DropdownMenuItem(
          child: Text(
            "Male",
            style: TextStyle(color: Colors.white),
          ),
          value: "Male",
        ),
      ],
      onChanged: (value1) {
        setState(() {
          _option1 = value1;
        });
      },
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: _option1,
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      validator: (value) {
        if (value == null) {
          return 'Please choose an option...';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _gender = value;
      },
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Your Info",
          style: GoogleFonts.staatliches(
            textStyle: TextStyle(
              fontSize: 35,
            ),
          ),
        ),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/log.jpg"),
                  fit: BoxFit.cover,
                )),
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 30, right: 30, top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 25,
                            ),
                            nameField,
                            SizedBox(
                              height: 25,
                            ),
                            surnameField,
                            SizedBox(
                              height: 25,
                            ),
                            ageField,
                            SizedBox(
                              height: 30,
                            ),
                            genderSelection,
                            SizedBox(
                              height: 30,
                            ),
                            currentWeight,
                            SizedBox(
                              height: 35,
                            ),
                            goalWeight,
                            SizedBox(
                              height: 35,
                            ),
                            height,
                            SizedBox(
                              height: 40,
                            ),
                            activityOption,
                            SizedBox(
                              height: 35,
                            ),
                            button,
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  void _calcDailyCalorie() {
    int _weightDiff = (_goalWeight - _weight);

    if (_gender == 'Male') {
      double bmh = 66.5 + (13.75 * _weight) + (5.03 * _height) - (6.75 * _age);

      switch (_activity) {
        case 1:
          _dailyTotalCal = bmh * (1.2);

          if (_weightDiff < 0) {
            //Want to lose weight
            _dailyProteinCal = (_dailyTotalCal * 65) / 100;
            _dailyCarbohydrateCal = (_dailyTotalCal * 30) / 100;
            _dailyFatCal = (_dailyTotalCal * 5) / 100;
          } else if (_weightDiff > 0) {
            //Want to gain weight
            _dailyProteinCal = (_dailyTotalCal * 50) / 100;
            _dailyCarbohydrateCal = (_dailyTotalCal * 45) / 100;
            _dailyFatCal = (_dailyTotalCal * 5) / 100;
          } else {
            //Don't want to lose or gain weight
            _dailyProteinCal = (_dailyTotalCal * 55) / 100;
            _dailyCarbohydrateCal = (_dailyTotalCal * 40) / 100;
            _dailyFatCal = (_dailyTotalCal * 5) / 100;
          }

          break;
        case 2:
          _dailyTotalCal = bmh * (1.3);

          if (_weightDiff < 0) {
            //Want to lose weight
            _dailyProteinCal = (_dailyTotalCal * 55) / 100;
            _dailyCarbohydrateCal = (_dailyTotalCal * 40) / 100;
            _dailyFatCal = (_dailyTotalCal * 5) / 100;
          } else if (_weightDiff > 0) {
            //Want to gain weight
            _dailyProteinCal = (_dailyTotalCal * 45) / 100;
            _dailyCarbohydrateCal = (_dailyTotalCal * 50) / 100;
            _dailyFatCal = (_dailyTotalCal * 5) / 100;
          } else {
            //Don't want to lose or gain weight
            _dailyProteinCal = (_dailyTotalCal * 50) / 100;
            _dailyCarbohydrateCal = (_dailyTotalCal * 45) / 100;
            _dailyFatCal = (_dailyTotalCal * 5) / 100;
          }

          break;
        case 3:
          _dailyTotalCal = bmh * (1.55);

          if (_weightDiff < 0) {
            //Want to lose weight
            _dailyProteinCal = (_dailyTotalCal * 60) / 100;
            _dailyCarbohydrateCal = (_dailyTotalCal * 35) / 100;
            _dailyFatCal = (_dailyTotalCal * 5) / 100;
          } else if (_weightDiff > 0) {
            //Want to gain weight
            _dailyProteinCal = (_dailyTotalCal * 45) / 100;
            _dailyCarbohydrateCal = (_dailyTotalCal * 50) / 100;
            _dailyFatCal = (_dailyTotalCal * 5) / 100;
          } else {
            //Don't want to lose or gain weight
            _dailyProteinCal = (_dailyTotalCal * 50) / 100;
            _dailyCarbohydrateCal = (_dailyTotalCal * 45) / 100;
            _dailyFatCal = (_dailyTotalCal * 5) / 100;
          }

          break;
        case 4:
          _dailyTotalCal = bmh * (1.7);

          if (_weightDiff < 0) {
            //Want to lose weight
            _dailyProteinCal = (_dailyTotalCal * 65) / 100;
            _dailyCarbohydrateCal = (_dailyTotalCal * 30) / 100;
            _dailyFatCal = (_dailyTotalCal * 5) / 100;
          } else if (_weightDiff > 0) {
            //Want to gain weight
            _dailyProteinCal = (_dailyTotalCal * 40) / 100;
            _dailyCarbohydrateCal = (_dailyTotalCal * 50) / 100;
            _dailyFatCal = (_dailyTotalCal * 10) / 100;
          } else {
            //Don't want to lose or gain weight
            _dailyProteinCal = (_dailyTotalCal * 49) / 100;
            _dailyCarbohydrateCal = (_dailyTotalCal * 49) / 100;
            _dailyFatCal = (_dailyTotalCal * 2) / 100;
          }
          break;
      }
    } else if (_gender == 'Female') {
      double bmh = 665.1 + (9.56 * _weight) + (1.85 * _height) - (4.68 * _age);

      switch (_activity) {
        case 1:
          _dailyTotalCal = bmh * (1.2);

          if (_weightDiff < 0) {
            //Want to lose weight
            _dailyProteinCal = (_dailyTotalCal * 65) / 100;
            _dailyCarbohydrateCal = (_dailyTotalCal * 30) / 100;
            _dailyFatCal = (_dailyTotalCal * 5) / 100;
          } else if (_weightDiff > 0) {
            //Want to gain weight
            _dailyProteinCal = (_dailyTotalCal * 45) / 100;
            _dailyCarbohydrateCal = (_dailyTotalCal * 50) / 100;
            _dailyFatCal = (_dailyTotalCal * 5) / 100;
          } else {
            //Don't want to lose or gain weight
            _dailyProteinCal = (_dailyTotalCal * 60) / 100;
            _dailyCarbohydrateCal = (_dailyTotalCal * 35) / 100;
            _dailyFatCal = (_dailyTotalCal * 5) / 100;
          }

          break;
        case 2:
          _dailyTotalCal = bmh * (1.3);

          if (_weightDiff < 0) {
            //Want to lose weight
            _dailyProteinCal = (_dailyTotalCal * 55) / 100;
            _dailyCarbohydrateCal = (_dailyTotalCal * 40) / 100;
            _dailyFatCal = (_dailyTotalCal * 5) / 100;
          } else if (_weightDiff > 0) {
            //Want to gain weight
            _dailyProteinCal = (_dailyTotalCal * 50) / 100;
            _dailyCarbohydrateCal = (_dailyTotalCal * 45) / 100;
            _dailyFatCal = (_dailyTotalCal * 5) / 100;
          } else {
            //Don't want to lose or gain weight
            _dailyProteinCal = (_dailyTotalCal * 55) / 100;
            _dailyCarbohydrateCal = (_dailyTotalCal * 40) / 100;
            _dailyFatCal = (_dailyTotalCal * 5) / 100;
          }

          break;
        case 3:
          _dailyTotalCal = bmh * (1.55);

          if (_weightDiff < 0) {
            //Want to lose weight
            _dailyProteinCal = (_dailyTotalCal * 55) / 100;
            _dailyCarbohydrateCal = (_dailyTotalCal * 40) / 100;
            _dailyFatCal = (_dailyTotalCal * 5) / 100;
          } else if (_weightDiff > 0) {
            //Want to gain weight
            _dailyProteinCal = (_dailyTotalCal * 50) / 100;
            _dailyCarbohydrateCal = (_dailyTotalCal * 45) / 100;
            _dailyFatCal = (_dailyTotalCal * 5) / 100;
          } else {
            //Don't want to lose or gain weight
            _dailyProteinCal = (_dailyTotalCal * 55) / 100;
            _dailyCarbohydrateCal = (_dailyTotalCal * 40) / 100;
            _dailyFatCal = (_dailyTotalCal * 5) / 100;
          }

          break;
        case 4:
          _dailyTotalCal = bmh * (1.7);

          if (_weightDiff < 0) {
            //Want to lose weight
            _dailyProteinCal = (_dailyTotalCal * 60) / 100;
            _dailyCarbohydrateCal = (_dailyTotalCal * 35) / 100;
            _dailyFatCal = (_dailyTotalCal * 5) / 100;
          } else if (_weightDiff > 0) {
            //Want to gain weight
            _dailyProteinCal = (_dailyTotalCal * 50) / 100;
            _dailyCarbohydrateCal = (_dailyTotalCal * 50) / 100;
            _dailyFatCal = (_dailyTotalCal * 2) / 100;
          } else {
            //Don't want to lose or gain weight
            _dailyProteinCal = (_dailyTotalCal * 49) / 100;
            _dailyCarbohydrateCal = (_dailyTotalCal * 49) / 100;
            _dailyFatCal = (_dailyTotalCal * 2) / 100;
          }
          break;
      }
    }
  }
}
