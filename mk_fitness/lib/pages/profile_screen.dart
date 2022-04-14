import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = true;
  bool _edit = false;

  int _age, _height, _weight, _goalWeight, _activity, _activityValue;

  double _dailyProteinCal, _dailyCarbohydrateCal, _dailyFatCal, _dailyTotalCal;

  String _gender, _option1 = 'Gender';
  String _name, _surname;

  Map<String, dynamic> _userMap;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  void _getData() async {
    DocumentReference _userRef =
    _firestore.collection('users').doc(_auth.currentUser.uid);

    DocumentSnapshot _docSnap = await _userRef.get();

    setState(() {
      _userMap = _docSnap.data();
      _activity = _userMap['activity'];
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "PROFILE",
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
            : Container(
          child: !_edit
              ? ListView(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name :",
                        style: GoogleFonts.righteous(
                          textStyle: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                      Text(
                        _userMap['name'],
                        style: GoogleFonts.architectsDaughter(
                          textStyle: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Surname :",
                        style: GoogleFonts.righteous(
                          textStyle: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                      Text(
                        _userMap['surname'],
                        style: GoogleFonts.architectsDaughter(
                          textStyle: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Age :",
                        style: GoogleFonts.righteous(
                          textStyle: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                      Text(
                        '${_userMap['age'].toString()}',
                        style: GoogleFonts.architectsDaughter(
                          textStyle: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Gender :",
                        style: GoogleFonts.righteous(
                          textStyle: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                      Text(
                        _userMap['gender'],
                        style: GoogleFonts.architectsDaughter(
                          textStyle: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Height (cms) :",
                        style: GoogleFonts.righteous(
                          textStyle: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                      Text(
                        '${_userMap['height'].toString()} cm',
                        style: GoogleFonts.architectsDaughter(
                          textStyle: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Weight :",
                        style: GoogleFonts.righteous(
                          textStyle: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                      Text(
                        '${_userMap['weight'].toString()} kg',
                        style: GoogleFonts.architectsDaughter(
                          textStyle: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Goal Weight :",
                        style: GoogleFonts.righteous(
                          textStyle: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                      Text(
                        '${_userMap['goal_weight'].toString()} kg',
                        style: GoogleFonts.architectsDaughter(
                          textStyle: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Activity Level:",
                        style: GoogleFonts.righteous(
                          textStyle: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                      Text(
                        '${_userMap['activity'].toString()}',
                        style: GoogleFonts.architectsDaughter(
                          textStyle: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _edit = true;
                    });
                  },
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
          )
              : Form(
            key: _formKey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: _userMap['name'],
                        decoration: InputDecoration(
                          labelText: 'Name',
                        ),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.done,
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
                            _userMap['name'] = enteredValue;
                          });
                        },
                      ),
                      TextFormField(
                        initialValue: _userMap['surname'],
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'Surname',
                        ),
                        validator: (enteredValue) {
                          if (enteredValue.length == 0) {
                            return "Invalid Name";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (enteredValue) {
                          setState(() {
                            _surname = enteredValue;
                            _userMap['surname'] = enteredValue;
                          });
                        },
                      ),
                      TextFormField(
                        initialValue: _userMap['age'].toString(),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: 'Age',
                        ),
                        validator: (enteredValue) {
                          try {
                            if (int.parse(enteredValue) < 0 ||
                                enteredValue == null) {
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
                            _userMap['age'] = int.parse(enteredValue);
                          });
                        },
                      ),
                      DropdownButtonFormField(
                        value: _userMap['gender'],
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
                          labelText: 'Gender',
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Please choose an option...';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          _userMap['gender'] = value;
                          _gender = value;
                        },
                      ),
                      TextFormField(
                        initialValue: _userMap['height'].toString(),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: 'Height',
                        ),
                        validator: (enteredValue) {
                          try {
                            if (int.parse(enteredValue) <= 0 ||
                                enteredValue == null) {
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
                            _userMap['height'] = int.parse(enteredValue);
                            _height = int.parse(enteredValue);
                          });
                        },
                      ),
                      TextFormField(
                        initialValue: _userMap['weight'].toString(),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: 'Weight',
                        ),
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
                            _userMap['weight'] = int.parse(enteredValue);
                            _weight = int.parse(enteredValue);
                          });
                        },
                      ),
                      TextFormField(
                        initialValue:
                        _userMap['goal_weight'].toString(),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: 'Goal Weight',
                        ),
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
                            _userMap['goal_weight'] = int.parse(enteredValue);
                            _goalWeight = int.parse(enteredValue);
                          });
                        },
                      ),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          labelText: 'Activity',
                        ),
                        isExpanded: true,
                        value: _activity,
                        items: [
                          DropdownMenuItem(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                "- I am not working out at all",
                                style:
                                TextStyle(color: Colors.white),
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
                                style:
                                TextStyle(color: Colors.white),
                              ),
                            ),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                  "- 3-5 days workout in a week.",
                                  style: TextStyle(
                                      color: Colors.white)),
                            ),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                "- 6-7 days workout in a week.",
                                style:
                                TextStyle(color: Colors.white),
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
                        validator: (value) {
                          if (value == null) {
                            return 'Please choose an option...';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          _activityValue = value;
                          _userMap['activity'] = value;
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _updateData();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Save',
                          style: GoogleFonts.staatliches(
                            textStyle: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.save_alt,
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _edit = false;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Cancel',
                          style: GoogleFonts.staatliches(
                            textStyle: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_back,
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

  void _updateData() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      setState(() {
        _isLoading  = true;
      });

      _calcDailyCalorie();

      await _firestore.collection('users').doc(_auth.currentUser.uid).update({
        'name': _name,
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
      });

      setState(() {
        _isLoading = false;
        _edit = false;
      });
    }
  }

  void _calcDailyCalorie() {
    int _weightDiff = (_goalWeight - _weight);

    if (_gender == 'Male') {
      double bmh =
          66.5 + (13.75 * _weight) + (5.03 * _height) - (6.75 * _age);

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
    }
    else if (_gender == 'Female') {
      double bmh =
          665.1 + (9.56 * _weight) + (1.85 * _height) - (4.68 * _age);

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
