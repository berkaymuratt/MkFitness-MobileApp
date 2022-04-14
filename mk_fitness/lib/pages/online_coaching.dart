import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnlineCoaching extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "ONLINE COACHING",
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
            Container(
              padding: EdgeInsets.all(20),
              child: Image(
                image: (AssetImage("assets/images/coach1.jpg")),
              ),
            ),
            Container(
              child: Card(
                child: ListTile(
                  title: Text(
                    "Mert Ketenci",
                    style:
                        GoogleFonts.anton(textStyle: TextStyle(fontSize: 30)),
                  ),
                  leading: Icon(Icons.fitness_center),
                  subtitle: (Text(
                    "NASM certified personal trainer,+10 years of experience on sport, also coach of our second coach Sarp Ketenci for +8 years,for more information contact him with the following mail address 'm.mertketenci@gmail.com'",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  )),
                ),
              ),
            ),
            Divider(thickness: 5),
            Container(
              padding: EdgeInsets.all(20),
              child: Image(
                image: (AssetImage("assets/images/coach2.jpg")),
              ),
            ),
            Container(
              child: Card(
                child: ListTile(
                  title: Text(
                    "Sarp Ketenci",
                    style:
                        GoogleFonts.anton(textStyle: TextStyle(fontSize: 30)),
                  ),
                  leading: Icon(Icons.fitness_center),
                  subtitle: (Text(
                    "Trained by some of the best in this sport,student of Mert Ketenci and Mutlu Peker, +8 years of experience in this sport,for more information contact him with the following mail address 'sarpketenci8@gmail.com'.",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  )),
                ),
              ),
            ),
            Divider(thickness: 5),
          ],
        ),
      ),
    );
  }
}
