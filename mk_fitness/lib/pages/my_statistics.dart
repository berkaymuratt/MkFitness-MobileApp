import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyStatistics extends StatefulWidget {
  @override
  _MyStatisticsState createState() => _MyStatisticsState();
}

class _MyStatisticsState extends State<MyStatistics> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _isLoading = true;

  List<_DateCal> protein = [];
  List<_DateCal> carbohydrate = [];
  List<_DateCal> fat = [];
  List<_DateCal> total = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    CollectionReference _historyRef = _firestore
        .collection('users')
        .doc(_auth.currentUser.uid)
        .collection('calorie-history');

    QuerySnapshot _history =
        await _historyRef.orderBy('date').limitToLast(5).get();

    for (var doc in _history.docs) {
      setState(() {
        protein.add(_DateCal(
            date:
                '${doc.get('day').toString()}.${doc.get('month').toString()}.${doc.get('year').toString()}',
            calorieAmount: doc.get('protein-calorie-amount')));
        carbohydrate.add(_DateCal(
            date:
                '${doc.get('day').toString()}.${doc.get('month').toString()}.${doc.get('year').toString()}',
            calorieAmount: doc.get('carbohydrate-calorie-amount')));
        fat.add(_DateCal(
            date:
                '${doc.get('day').toString()}.${doc.get('month').toString()}.${doc.get('year').toString()}',
            calorieAmount: doc.get('fat-calorie-amount')));
        total.add(_DateCal(
            date:
                '${doc.get('day').toString()}.${doc.get('month').toString()}.${doc.get('year').toString()}',
            calorieAmount: doc.get('total-calorie-amount')));
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "MY STATISTICS",
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
            : Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Your Calorie History',
                          style: GoogleFonts.russoOne(
                            textStyle: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '(Last ${total.length} Days)',
                          style: GoogleFonts.russoOne(
                            textStyle: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              margin: EdgeInsets.all(5),
                              height: 1,
                              color: Colors.white,
                              child: Text("."),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      // Enable legend
                      legend:
                          Legend(isVisible: true, position: LegendPosition.top),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<_DateCal, String>>[
                        ColumnSeries<_DateCal, String>(
                          dataSource: protein,
                          xValueMapper: (cal, _) => cal.date,
                          yValueMapper: (cal, _) => cal.calorieAmount,
                          color: Colors.cyanAccent,
                          name: 'Protein cal',
                        ),
                        ColumnSeries<_DateCal, String>(
                          dataSource: carbohydrate,
                          xValueMapper: (cal, _) => cal.date,
                          yValueMapper: (cal, _) => cal.calorieAmount,
                          color: Colors.deepOrangeAccent,
                          name: 'Carb cal',
                        ),
                        ColumnSeries<_DateCal, String>(
                          dataSource: fat,
                          xValueMapper: (cal, _) => cal.date,
                          yValueMapper: (cal, _) => cal.calorieAmount,
                          color: Colors.deepPurpleAccent,
                          name: 'Fat cal',
                        ),
                        ColumnSeries<_DateCal, String>(
                          dataSource: total,
                          xValueMapper: (cal, _) => cal.date,
                          yValueMapper: (cal, _) => cal.calorieAmount,
                          color: Colors.greenAccent,
                          name: 'Total',
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Column(
                          children: [
                            Text(
                              'The Average Calories per Day',
                              style: GoogleFonts.russoOne(
                                textStyle: TextStyle(
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              '(Last ${total.length} Days)',
                              style: GoogleFonts.russoOne(
                                textStyle: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              margin: EdgeInsets.all(5),
                              height: 1,
                              color: Colors.white,
                              child: Text("."),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'The average of total calorie : ',
                                  style: GoogleFonts.bebasNeue(
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '${_calcAverage(total).toStringAsFixed(2)} cal',
                                style: GoogleFonts.bebasNeue(
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.greenAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'The average of protein calorie : ',
                                  style: GoogleFonts.bebasNeue(
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '${_calcAverage(protein).toStringAsFixed(2)} cal',
                                style: GoogleFonts.bebasNeue(
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.cyanAccent,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'The average of carbohydrate calorie : ',
                                  style: GoogleFonts.bebasNeue(
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '${_calcAverage(carbohydrate).toStringAsFixed(2)} cal',
                                style: GoogleFonts.bebasNeue(
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.deepOrangeAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'The average of fat calorie : ',
                                  style: GoogleFonts.bebasNeue(
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '${_calcAverage(fat).toStringAsFixed(2)} cal',
                                style: GoogleFonts.bebasNeue(
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.deepPurpleAccent,
                                  ),
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
    );
  }

  double _calcAverage(List values) {
    double sum = 0.00;
    double average = 0.00;

    for (int i = 0; i < values.length; i++) {
      sum += values[i].calorieAmount;
    }

    average = sum / values.length;

    return average;
  }
}

class _DateCal {
  _DateCal({this.date, this.calorieAmount});

  final String date;
  final double calorieAmount;
}
