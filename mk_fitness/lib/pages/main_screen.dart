import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/pages/loading_screen.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  int _dayNumber;
  int _monthNumber;
  int _yearNumber;
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _updateData();
  }

  void _updateData() async {
    try {
      DocumentReference _userRef =
      _firestore.collection('users').doc(_auth.currentUser.uid);

      DocumentSnapshot _docSnap = await _userRef.get();

      setState(() {
        _dayNumber = Timestamp
            .now()
            .toDate()
            .day;
        _monthNumber = Timestamp
            .now()
            .toDate()
            .month;
        _yearNumber = Timestamp
            .now()
            .toDate()
            .year;
      });

      if ((_dayNumber) != (_docSnap.get('day')) ||
          (_monthNumber) != (_docSnap.get('month')) ||
          (_yearNumber) != (_docSnap.get('year'))) {
        await _userRef
            .collection('calorie-history')
            .doc(
            '${_docSnap.get('day')}.${_docSnap.get('month')}.${_docSnap.get(
                'year')}')
            .set({
          'day': _docSnap.get('day'),
          'month': _docSnap.get('month'),
          'year': _docSnap.get('year'),
          'total-calorie-amount': _docSnap.get('total-calorie-amount'),
          'protein-calorie-amount': _docSnap.get('protein-calorie-amount'),
          'carbohydrate-calorie-amount':
          _docSnap.get('carbohydrate-calorie-amount'),
          'fat-calorie-amount': _docSnap.get('fat-calorie-amount'),
          'date': Timestamp
              .fromDate(DateTime(_docSnap.get('year'),
              _docSnap.get('month'), _docSnap.get('day')))
              .seconds,
        });

        showMessage(_docSnap);

        await _userRef.update({
          'day': _dayNumber,
          'month': _monthNumber,
          'year': _yearNumber,
          'menu': {},
          'tried-to-find-menu' : false,
          'total-calorie-amount': 0.00,
          'protein-calorie-amount': 0.00,
          'carbohydrate-calorie-amount': 0.00,
          'fat-calorie-amount': 0.00,
        });
      }

      setState(() {
        _isLoading = false;
      });
    } catch(e) {
      if(e.toString() == "Bad state: cannot get a field on a DocumentSnapshotPlatform which does not exist") {
        Navigator.pushReplacementNamed(context, "/user_info");
      } else {
        debugPrint(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? LoadingScreen()
        : Scaffold(
            drawer: Drawer(
              child: DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "MK FITNESS",
                            style: GoogleFonts.russoOne(
                              textStyle: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Icon(Icons.account_box),
                                SizedBox(width: 10),
                                Text(
                                  "Profile",
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () =>
                              Navigator.pushNamed(context, "/profile_screen"),
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Icon(Icons.settings),
                                SizedBox(width: 10),
                                Text(
                                  "Settings",
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, "/settings_screen");
                          },
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Icon(Icons.logout),
                                SizedBox(width: 10),
                                Text(
                                  "Log Out",
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () async {
                            await _auth.signOut();
                            Navigator.pushReplacementNamed(
                                context, "/login_screen");
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  floating: false,
                  expandedHeight: 400,
                  backgroundColor: Colors.black,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      "MK FITNESS",
                      style: GoogleFonts.russoOne(
                        textStyle: TextStyle(
                          fontSize: 32,
                        ),
                      ),
                    ),
                    background: Image.asset(
                      "assets/images/photo3.jpg",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.all(10),
                  sliver: SliverToBoxAdapter(
                    child: GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "WORKOUTS",
                              style: GoogleFonts.bigShouldersDisplay(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 35,
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Icon(
                              Icons.fitness_center,
                              color: Colors.black,
                              size: 35,
                            ),
                          ],
                        ),
                        height: 100,
                      ),
                      onTap: () => Navigator.pushNamed(context, "/workouts"),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.all(8),
                  sliver: SliverToBoxAdapter(
                    child: GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "DIET",
                              style: GoogleFonts.bigShouldersDisplay(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 35,
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Icon(
                              Icons.no_food,
                              color: Colors.black,
                              size: 35,
                            ),
                          ],
                        ),
                        height: 100,
                      ),
                      onTap: () => Navigator.pushNamed(context, "/diet"),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.all(8),
                  sliver: SliverToBoxAdapter(
                    child: GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "MY STATISTICS",
                              style: GoogleFonts.bigShouldersDisplay(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 35,
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Icon(
                              Icons.data_usage,
                              color: Colors.black,
                              size: 35,
                            ),
                          ],
                        ),
                        height: 100,
                      ),
                      onTap: () =>
                          Navigator.pushNamed(context, "/my_statistics"),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.all(8),
                  sliver: SliverToBoxAdapter(
                    child: GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "ONLINE COACHING",
                              style: GoogleFonts.bigShouldersDisplay(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 33,
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Icon(
                              Icons.group_rounded,
                              color: Colors.black,
                              size: 35,
                            ),
                          ],
                        ),
                        height: 100,
                      ),
                      onTap: () =>
                          Navigator.pushNamed(context, "/online_coaching"),
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  void showMessage(DocumentSnapshot docSnap) async {
    bool _problem;

    double _diff = (docSnap.get('total-calorie-amount')) -
        (docSnap.get('daily-total-cal-goal'));

    if (_diff >= 750) {
      _problem = true;
    } else {
      _problem = false;
    }

    await showDialog(
      context: context,
      builder: (context) {
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: GestureDetector(
                        child: Icon(
                          Icons.close,
                        ),
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "The Last Day",
                              style: GoogleFonts.russoOne(
                                textStyle: TextStyle(
                                  fontSize: 30,
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
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Text(
                          'The total calorie you gained: ${docSnap.get('total-calorie-amount').toStringAsFixed(2)} cal',
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'protein: ${docSnap.get('fat-calorie-amount').toStringAsFixed(2)} cal',
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'carbohydrate: ${docSnap.get('carbohydrate-calorie-amount').toStringAsFixed(2)} cal',
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'fat: ${docSnap.get('fat-calorie-amount').toStringAsFixed(2)} cal',
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 80),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Your Daily Goals",
                              style: GoogleFonts.russoOne(
                                textStyle: TextStyle(
                                  fontSize: 30,
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
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Text(
                          'The total calorie you should gain: ${docSnap.get('daily-total-cal-goal').toStringAsFixed(2)} cal',
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'protein: ${docSnap.get('daily-protein-cal-goal').toStringAsFixed(2)} cal',
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'carbohydrate: ${docSnap.get('daily-carbohydrate-cal-goal').toStringAsFixed(2)} cal',
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'fat: ${docSnap.get('daily-fat-cal-goal').toStringAsFixed(2)} cal',
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 80),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: _problem
                          ? Text(
                              'WARNING : The last day, you have exceeded your calorie limit. You should be careful about what you eat and drink to reach your goals. Do not forget it !',
                              style: GoogleFonts.hammersmithOne(
                                textStyle: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            )
                          : Text(
                              'You are going well. Keep Going !',
                              style: GoogleFonts.hammersmithOne(
                                textStyle: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
