import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Workouts extends StatefulWidget {
  @override
  _WorkoutsState createState() => _WorkoutsState();
}

class _WorkoutsState extends State<Workouts> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final button1 = MaterialButton(
      onPressed: () {
        Navigator.pushNamed(
            context, "/full_body_workout");
      },

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
                "For more detailed information about full-body workout click here"),
          ),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
    final button2 = MaterialButton(
      onPressed: () {
        Navigator.pushNamed(
            context, "/push_pull_legs_workout");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
                "For more detailed information about push-pull-legs workout click here"),
          ),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
    final button3 = MaterialButton(
      onPressed: () {
        Navigator.pushNamed(
            context, "/glutes_workout");
      },
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text("For more detailed information about glutes workout click here"),
          ),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "WORKOUTS",
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
          child: ListView(
                  children: [
                    Card(
                      child: ExpansionTile(
                        title: Text(
                          "Full-body workout",
                          style: GoogleFonts.anton(
                              textStyle: (TextStyle(fontSize: 30))),
                        ),
                        leading: Icon(Icons.fitness_center),
                        children: [
                          Text(
                            "This workout focuses on your whole body. Most suitable for 3 or 6 days of training. If it is preferred for 6 days after every 3 days there must be a rest day.",
                            style: GoogleFonts.abel(
                                textStyle: TextStyle(fontSize: 15)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    button1,
                    Divider(thickness: 3, color: Colors.white),
                    Card(
                      child: ExpansionTile(
                        title: Text(
                          "Push-Pull-Legs workout",
                          style: GoogleFonts.anton(
                              textStyle: (TextStyle(fontSize: 30))),
                        ),
                        leading: Icon(Icons.fitness_center),
                        children: [
                          Text(
                            "In this program one day you will focus on your muscles which is working while pushing,next day you will focus on your muscles which is working while pulling,and the next you will focus on your legs. After every 3 days you must have a rest day.",
                            style: GoogleFonts.abel(
                                textStyle: TextStyle(fontSize: 15)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    button2,
                    Divider(thickness: 3, color: Colors.white),
                    Card(
                      child: ExpansionTile(
                        title: Text(
                          "Glutes workout",
                          style: GoogleFonts.anton(
                              textStyle: TextStyle(fontSize: 30)),
                        ),
                        leading: Icon(Icons.fitness_center),
                        children: [
                          Text(
                            "Glutes are one of the most ignored body part.That's why this program is designed to develop your glutes like the rest of your body.",
                            style: GoogleFonts.abel(
                                textStyle: TextStyle(fontSize: 15)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    button3,
                    Divider(thickness: 3, color: Colors.white),
                  ],
                )),
    );
  }
}
