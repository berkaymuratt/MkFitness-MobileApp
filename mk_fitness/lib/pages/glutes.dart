import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Glutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Glutes workout",
          style: GoogleFonts.bigShouldersDisplay(
              textStyle: TextStyle(color: Colors.white, fontSize: 40)),
        ),
      ),
      body: Center(
        child: ListView(
          children: [Card(
            child: ListTile(
              leading: Icon(Icons.fitness_center),
              title: Text(
                "Hip Thrust",
                style: GoogleFonts.anton(textStyle: TextStyle(fontSize: 30)),
              ),
              subtitle: Text("First exercise 3-5 sets 12-15 repetitions"),
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (context) {
                    return Scaffold(
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "First exercise detail",
                              style: TextStyle(
                                fontSize: 35,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                                  elevation: MaterialStateProperty.all(10),
                                ),
                                onPressed: () => Navigator.pop(context),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: FadeInImage.assetNetwork(
                                        placeholder: "assets/loading.gif", image: "https://media.tenor.com/images/a7ce208fc9f1ce45ef49fdee6372b06b/tenor.gif",
                                      ),
                                    ),
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
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
            Card(
              child: ListTile(
                leading: Icon(Icons.fitness_center),
                title: Text(
                  "Bulgarian Split Squat",
                  style: GoogleFonts.anton(textStyle: TextStyle(fontSize: 30)),
                ),
                subtitle: Text(
                    "Second exercise 3-5 sets 10-15 repetitions per leg"),
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return Scaffold(
                        body: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Second exercise detail",
                                style: TextStyle(
                                  fontSize: 35,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                    elevation: MaterialStateProperty.all(10),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: FadeInImage.assetNetwork(
                                          placeholder: "assets/loading.gif", image: "https://thumbs.gfycat.com/SilverAmazingGreendarnerdragonfly-size_restricted.gif",
                                        ),
                                      ),
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
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.fitness_center),
                title: Text(
                  "Dumbbell step ups",
                  style: GoogleFonts.anton(textStyle: TextStyle(fontSize: 30)),
                ),
                subtitle: Text(
                    "Third exercise 3-5 sets 10-15 repetitions per leg"),
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return Scaffold(
                        body: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Third exercise detail",
                                style: TextStyle(
                                  fontSize: 35,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                    elevation: MaterialStateProperty.all(10),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Expanded(
                                        child: FadeInImage.assetNetwork(
                                          placeholder: "assets/loading.gif", image: "https://blog.myfitnesspal.com/wp-content/uploads/2019/07/Slow-negative-step-ups.gif",
                                        ),
                                      ),
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
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.fitness_center),
                title: Text(
                  "Lateral band walks",
                  style: GoogleFonts.anton(textStyle: TextStyle(fontSize: 30)),
                ),
                subtitle: Text("Fourth exercise 3-5 sets 15 steps per side"),
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return Scaffold(
                        body: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Fourth exercise detail",
                                style: TextStyle(
                                  fontSize: 35,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                    elevation: MaterialStateProperty.all(10),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Expanded(
                                        child: FadeInImage.assetNetwork(
                                          placeholder: "assets/loading.gif", image: "https://media.self.com/photos/58e7dd9d3172253b0d06ff08/master/pass/Booty-Band-Side-Steps.gif",
                                        ),
                                      ),
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
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.fitness_center),
                title: Text(
                  "Side glute kickbacks",
                  style: GoogleFonts.anton(textStyle: TextStyle(fontSize: 30)),
                ),
                subtitle: Text(
                    "Fifth exercise 3-5 sets 12-15 repetitions per leg"),
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return Scaffold(
                        body: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Fifth exercise detail",
                                style: TextStyle(
                                  fontSize: 35,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                    elevation: MaterialStateProperty.all(10),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: FadeInImage.assetNetwork(
                                          placeholder: "assets/loading.gif", image: "https://i0.wp.com/wifeydiaries.com/wp-content/uploads/2019/01/Cable-Hip-Abduction.gif?resize=300%2C169",
                                        ),
                                      ),
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
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.fitness_center),
                title: Text(
                  "Hip abduction",
                  style: GoogleFonts.anton(textStyle: TextStyle(fontSize: 30)),
                ),
                subtitle: Text("Last exercise 3-5 sets 12-15 repetitions"),
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return Scaffold(
                        body: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Last exercise detail",
                                style: TextStyle(
                                  fontSize: 35,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                    elevation: MaterialStateProperty.all(10),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: FadeInImage.assetNetwork(
                                          placeholder: "assets/loading.gif", image: "https://www.sparkpeople.com/assets/exercises/Seated-Hip-Abduction-Machine.gif",
                                        ),
                                      ),
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
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

          ],

        ),
      ),
    );
  }
}
