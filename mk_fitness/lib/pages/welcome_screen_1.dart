import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen1 extends StatefulWidget {
  @override
  _WelcomeScreen1State createState() => _WelcomeScreen1State();
}

class _WelcomeScreen1State extends State<WelcomeScreen1> {
  var myController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.fitness_center,
          size: 40,
        ),
        onPressed: () {
          Navigator.pushReplacementNamed((context), "/login_screen");
        },
      ),
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        pageSnapping: true,
        controller: myController,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            decoration: myDecoration(index),
            child: Column(
                mainAxisAlignment: index == 0
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: index == 0 ? null : EdgeInsets.only(top: 100),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        getHeader(index),
                        SizedBox(height: 20),
                        getText(index),
                      ],
                    ),
                    width: double.infinity,
                  ),
                  Container(
                    alignment: Alignment.center,
                    color: Colors.grey,
                    child: index == 0
                        ? null
                        : Row(
                            children: <Widget>[],
                          ),
                    margin: EdgeInsets.only(
                      bottom: 50,
                      right: 50,
                      left: 50,
                      top: 100,
                    ),
                  ),
                ]),
          );
        },
      ),
    );
  }

  Container getHeader(int index) {
    const myTexts = [
      "Welcome to Healthy Life!",
      "Nothing great comes easy in life",
      "Your guide for your goal",
      "Proven by scientific facts",
      "We are willing to put on effort for your goal.",
    ];

    return Container(
      child: Text(
        myTexts[index],
        textAlign: TextAlign.center,
        textScaleFactor: 1,
        style: GoogleFonts.staatliches(
          textStyle: TextStyle(
            fontSize: 70,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Container getText(int index) {
    const myTexts = [
      "Slide for get more information. When you are ready, you can press the button !",
      "It is time to get out of your comfort zone!",
      "This application will be your guide as you get closer to your goal.",
      "Calculations made on this app are based on scientific facts and tested by professional athletes.",
      "If you are ready too,let's get started",
    ];

    if (index == 0) {
      return Container(
        //padding: EdgeInsets.all(3),
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(60)),
        ),
        child: Text(
          myTexts[index],
          textAlign: TextAlign.center,
          style: GoogleFonts.heebo(
            textStyle: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
      );
    } else {
      return Container(
        child: Text(
          myTexts[index],
          textAlign: TextAlign.center,
          style: GoogleFonts.heebo(
            textStyle: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }

  BoxDecoration myDecoration(index) {
    const images = [
      AssetImage("assets/images/firstPhoto.jpg"),
    ];

    if (index == 0) {
      return BoxDecoration(
        image: DecorationImage(
          image: images[index],
          fit: BoxFit.cover,
        ),
      );
    } else {
      return BoxDecoration(
        color: Colors.black,
      );
    }
  }
}
