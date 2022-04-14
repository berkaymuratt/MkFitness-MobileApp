import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Diet extends StatefulWidget {
  @override
  _DietState createState() => _DietState();
}

class _DietState extends State<Diet> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _isLoading = true;
  bool _isMenuCreated = false;

  String _itemName;
  int _itemType;

  double _proteinAmount;
  double _carbohydrateAmount;
  double _fatAmount;
  double _totalCalorieAmount;

  Map<String, dynamic> _userCalorie = Map();

  Map<String, dynamic> _menuMap = Map();

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
      _userCalorie = {
        'protein-calorie-amount': _docSnap.get('protein-calorie-amount'),
        'carbohydrate-calorie-amount':
        _docSnap.get('carbohydrate-calorie-amount'),
        'fat-calorie-amount': _docSnap.get('fat-calorie-amount'),
        'total-calorie-amount': _docSnap.get('total-calorie-amount'),
        'daily-total-cal-goal': _docSnap.get('daily-total-cal-goal'),
        'daily-protein-cal-goal': _docSnap.get('daily-protein-cal-goal'),
        'daily-carbohydrate-cal-goal':
        _docSnap.get('daily-carbohydrate-cal-goal'),
        'daily-fat-cal-goal': _docSnap.get('daily-fat-cal-goal'),
        'day' : _docSnap.get('day'),
      };
      _totalCalorieAmount = _userCalorie['total-calorie-amount'];
    });

    try {
      setState(() {
        _menuMap = _docSnap.get('menu');
      });
    } catch (e) {
      debugPrint(e.toString());
    }

    if (!_docSnap.get('tried-to-find-menu')) {
      debugPrint('Menu will change...');
      _getMenu();
    } else {
      try {

        if(_menuMap.length == 0) {
          debugPrint('Cannot found menu today...');

          setState(() {
            _isLoading = false;
            _isMenuCreated = false;
          });
        } else {
          debugPrint(_menuMap.toString());

          setState(() {
            debugPrint('Menu has been already created');
            _isLoading = false;
            _isMenuCreated = true;
          });
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  void _getMenu() async {
    DocumentReference _userRef =
    _firestore.collection('users').doc(_auth.currentUser.uid);


    String calorieType;
    int minF, maxF;
    int minS, maxS;
    int minD, maxD;

    try {

      if(_userCalorie['day'].isOdd) {
        calorieType = 'protein-calorie-amount';

        minF = 25;
        maxF = 135;

        minS = 10;
        maxS = 75;

        minD = 5;
        maxD = 50;

      } else {
        calorieType = 'carbohydrate-calorie-amount';

        minF = 50;
        maxF = 135;

        minS = 10;
        maxS = 80;

        minD = 5;
        maxD = 25;
      }

      //Foods
      QuerySnapshot _foods = await _userRef.collection('foods').orderBy(calorieType)
          .where(calorieType, isGreaterThanOrEqualTo: minF, isLessThanOrEqualTo: maxF).limitToLast(10).get();

      //Snacks

      QuerySnapshot _snacks = await _userRef.collection('snacks').orderBy(calorieType)
          .where(calorieType, isGreaterThanOrEqualTo: minS, isLessThanOrEqualTo: maxS).limitToLast(10).get();

      //Drinks

      QuerySnapshot _drinks = await _userRef.collection('drinks').orderBy(calorieType)
          .where(calorieType, isGreaterThanOrEqualTo: minD, isLessThanOrEqualTo: maxD).limitToLast(10).get();

      if (_foods.docs.length == 0 ||
          _snacks.docs.length == 0 ||
          _drinks.docs.length == 0) {
        debugPrint('cannot found menu today');

        await _userRef.update({
          'menu': {},
          'tried-to-find-menu' : true,
        });

        setState(() {
          _isLoading = false;
          _isMenuCreated = false;
        });
        return null;
      }

      debugPrint('Menu found');

      int foodsIndex = Random().nextInt(_foods.docs.length);
      int snacksIndex = Random().nextInt(_snacks.docs.length);
      int drinksIndex = Random().nextInt(_drinks.docs.length);

      Map<String, dynamic> _food = _foods.docs[foodsIndex].data();
      Map<String, dynamic> _snack = _snacks.docs[snacksIndex].data();
      Map<String, dynamic> _drink = _drinks.docs[drinksIndex].data();

      double _proteinCalorie;
      double _carbohydrateCalorie;
      double _fatCalorie;

      _proteinCalorie = _food['protein-calorie-amount'] +
          _snack['protein-calorie-amount'] +
          _drink['protein-calorie-amount'];

      _carbohydrateCalorie = _food['carbohydrate-calorie-amount'] +
          _snack['carbohydrate-calorie-amount'] +
          _drink['carbohydrate-calorie-amount'];

      _fatCalorie = _food['fat-calorie-amount'] +
          _snack['fat-calorie-amount'] +
          _drink['fat-calorie-amount'];

      setState(() {
        _menuMap = {
          'food-name': _food['name'],
          'snack-name': _snack['name'],
          'drink-name': _drink['name'],
          'protein-calorie-amount': _proteinCalorie,
          'carbohydrate-calorie-amount': _carbohydrateCalorie,
          'fat-calorie-amount': _fatCalorie,
          'total-calorie-amount':
          _proteinCalorie + _carbohydrateCalorie + _fatCalorie,
        };
      });

      await _userRef.update(
        {
          'menu': _menuMap,
          'tried-to-find-menu' : true,
        },
      );

      debugPrint('New menu has been created');

      setState(() {
        _isMenuCreated = true;
        _isLoading = false;
      });
    } catch (e) {
      debugPrint(e.toString());

      await _userRef.update({
        'tried-to-find-menu' : true,
      });

      setState(() {
        _isMenuCreated = false;
        _isLoading = false;
      });
    }
  }

  void _updateData() async {
    double _proteinCal = _proteinAmount * 4;
    double _carbohydrateCal = _carbohydrateAmount * 4;
    double _fatCal = _fatAmount * 9;

    DocumentReference _userRef =
    _firestore.collection('users').doc(_auth.currentUser.uid);

    await _userRef.update({
      'protein-calorie-amount': FieldValue.increment(_proteinCal),
      'carbohydrate-calorie-amount': FieldValue.increment(_carbohydrateCal),
      'fat-calorie-amount': FieldValue.increment(_fatCal),
      'total-calorie-amount': _totalCalorieAmount,
    });

    setState(() {
      _userCalorie['protein-calorie-amount'] += _proteinCal;
      _userCalorie['carbohydrate-calorie-amount'] += _carbohydrateCal;
      _userCalorie['fat-calorie-amount'] += _fatCal;
      _userCalorie['total-calorie-amount'] = _totalCalorieAmount;
    });

    Map<String, dynamic> item = {
      'name': _itemName,
      'protein-calorie-amount': _proteinCal,
      'carbohydrate-calorie-amount': _carbohydrateCal,
      'fat-calorie-amount': _fatCal,
      'total-calorie-amount': _proteinCal + _carbohydrateCal + _fatCal,
    };

    switch (_itemType) {
      case 1:
        await _userRef.collection('foods').doc(_itemName).set(item);

        break;
      case 2:
        await _userRef.collection('snacks').doc(_itemName).set(item);

        break;
      case 3:
        await _userRef.collection('drinks').doc(_itemName).set(item);

        break;
    }

    setState(() {
      _itemType = null;
    });

    debugPrint('saved...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "DIET",
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
            ? Center(child: CircularProgressIndicator())
            : CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    border: Border.all(
                      style: BorderStyle.solid,
                      color: Colors.white,
                      width: 5,
                    )),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(height: 5),
                    Text(
                      "Your Daily Calorie Goals",
                      style: GoogleFonts.russoOne(
                        textStyle: TextStyle(
                          fontSize: 21,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 1,
                          width: 300,
                          color: Colors.white,
                          child: Text("."),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Text(
                          'The total calorie you should consume: ${_userCalorie['daily-total-cal-goal']
                              .toStringAsFixed(2)} cal',
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'protein: ${_userCalorie['daily-protein-cal-goal']
                              .toStringAsFixed(2)} cal',
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'carbohydrate: ${_userCalorie['daily-carbohydrate-cal-goal']
                              .toStringAsFixed(2)} cal',
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'fat: ${_userCalorie['daily-fat-cal-goal']
                              .toStringAsFixed(2)} cal',
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    style: BorderStyle.solid,
                    width: 5,
                    color: Colors.white,
                  ),
                ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "TODAY",
                          style: GoogleFonts.russoOne(
                            textStyle: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 1,
                          width: 250,
                          color: Colors.white,
                          child: Text("."),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Column(
                      children: [
                        Text(
                          'The total calorie you consume: ${_userCalorie['total-calorie-amount']
                              .toStringAsFixed(2)} cal',
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'protein: ${_userCalorie['protein-calorie-amount']
                              .toStringAsFixed(2)} cal',
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'carbohydrate: ${_userCalorie['carbohydrate-calorie-amount']
                              .toStringAsFixed(2)} cal',
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'fat: ${_userCalorie['fat-calorie-amount']
                              .toStringAsFixed(2)} cal',
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.add_circle),
                              hintText: "Name",
                              labelText: "Item Name",
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            validator: (enteredValue) {
                              if (enteredValue.length == 0) {
                                return "Please enter a name";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                _itemName = value;
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          DropdownButtonFormField(
                            //isExpanded: true,
                            value: _itemType,
                            items: [
                              DropdownMenuItem(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    "- Food",
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
                                    "- Snack",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text("- Drink",
                                      style:
                                      TextStyle(color: Colors.white)),
                                ),
                                value: 3,
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _itemType = value;
                              });
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.black,
                              contentPadding:
                              EdgeInsets.fromLTRB(20, 15, 20, 15),
                              labelText: 'Item Type',
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(20)),
                            ),

                            validator: (value) {
                              if (value == null) {
                                return 'Please choose an option...';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                _itemType = value;
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            cursorColor: Colors.white,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: true),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.add_circle),
                              hintText: "Calorie",
                              labelText: "Protein Amount (g)",
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            validator: (value) {
                              try {
                                if (double.parse(value) < 0.0) {
                                  return 'Invalid Value';
                                } else {
                                  return null;
                                }
                              } catch (e) {
                                return 'Invalid Value';
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                _proteinAmount = double.parse(value);
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            cursorColor: Colors.white,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: true),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.add_circle),
                              hintText: "Calorie",
                              labelText: "Carbohydrate Amount (g)",
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            validator: (value) {
                              try {
                                if (double.parse(value) < 0.0) {
                                  return 'Invalid Value';
                                } else {
                                  return null;
                                }
                              } catch (e) {
                                return 'Invalid Value';
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                _carbohydrateAmount = double.parse(value);
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            textInputAction: TextInputAction.done,
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: true),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.add_circle),
                              hintText: "Calorie",
                              labelText: "Fat Amount (g)",
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            validator: (value) {
                              try {
                                if (double.parse(value) < 0.0) {
                                  return 'Invalid Value';
                                } else {
                                  return null;
                                }
                              } catch (e) {
                                return 'Invalid Value';
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                _fatAmount = double.parse(value);
                              });
                            },
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.grey),
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();

                              setState(() {
                                _totalCalorieAmount +=
                                (_proteinAmount * 4);
                                _totalCalorieAmount +=
                                (_carbohydrateAmount * 4);
                                _totalCalorieAmount += (_fatAmount * 9);
                              });

                              _updateData();
                              _formKey.currentState.reset();
                              _formKey.currentState.deactivate();
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("ADD"),
                              Icon(Icons.add),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "NOTE: The menu has been created by items before you ate or drank. It is an optional menu.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    border: Border.all(
                      style: BorderStyle.solid,
                      color: Colors.white,
                      width: 5,
                    )),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "Menu of the Day",
                      style: GoogleFonts.anton(
                        textStyle: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 1,
                          width: 300,
                          color: Colors.white,
                          child: Text("."),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: _isMenuCreated
                          ? Column(
                        children: [
                          Text(
                            "Food:  ${_menuMap['food-name']}",
                            style: GoogleFonts.architectsDaughter(
                              textStyle: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Text(
                            "Snack:  ${_menuMap['snack-name']}",
                            style: GoogleFonts.architectsDaughter(
                              textStyle: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Text(
                            "Drink:  ${_menuMap['drink-name']}",
                            style: GoogleFonts.architectsDaughter(
                              textStyle: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            "The total calorie you will consume: ${_menuMap['total-calorie-amount']
                                .toStringAsFixed(2)} cal",
                            style: GoogleFonts.comfortaa(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "protein: ${_menuMap['protein-calorie-amount']
                                .toStringAsFixed(2)} cal",
                            style: GoogleFonts.comfortaa(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Text(
                            "carbohydrate: ${_menuMap['carbohydrate-calorie-amount']
                                .toStringAsFixed(2)} cal",
                            style: GoogleFonts.comfortaa(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Text(
                            "fat: ${_menuMap['fat-calorie-amount']
                                .toStringAsFixed(2)} cal",
                            style: GoogleFonts.comfortaa(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      )
                          : Text(
                        'There is no any menu today..',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
