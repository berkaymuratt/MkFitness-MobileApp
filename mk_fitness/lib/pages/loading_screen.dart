import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  "MK FITNESS",
                  style: GoogleFonts.russoOne(
                    textStyle: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
