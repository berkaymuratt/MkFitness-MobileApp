import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FullBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Full-body workout",
          style: GoogleFonts.bigShouldersDisplay(
              textStyle: TextStyle(color: Colors.white, fontSize: 40)),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.fitness_center),
                title: Text(
                  "Chest Press",
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
                                          placeholder: "assets/loading.gif",
                                          image: "https://i.pinimg.com/originals/0a/b5/f3/0ab5f33d5e917395a6587befd42194c0.gif",
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
                  "Pec Dec Fly",
                  style: GoogleFonts.anton(textStyle: TextStyle(fontSize: 30)),
                ),
                subtitle: Text("Second exercise 3-5 sets 12-15 repetitions"),
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
                                          placeholder: "assets/loading.gif",
                                          image: "https://i.pinimg.com/originals/75/42/b8/7542b846694759bf67ea5bc702c2a852.gif",
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
                  "Lat Pull Down",
                  style: GoogleFonts.anton(textStyle: TextStyle(fontSize: 30)),
                ),
                subtitle: Text("Third exercise 3-5 sets 12-15 repetitions"),
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
                                          placeholder: "assets/loading.gif",
                                          image: "https://computerscience.johncabot.edu/mscaramastra/F2017/CS130-2/Petrucci/THE%20STRONGER%20THE%20HAPPIER/latmachine.gif",
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
                  "Seated Row",
                  style: GoogleFonts.anton(textStyle: TextStyle(fontSize: 30)),
                ),
                subtitle: Text("Fourth exercise 3-5 sets 12-15 repetitions"),
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
                                          placeholder: "assets/loading.gif",
                                          image: "https://i.imgur.com/cM0R5lK.gif",
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
                  "Dumbbell Shoulder Press",
                  style: GoogleFonts.anton(textStyle: TextStyle(fontSize: 30)),
                ),
                subtitle: Text("Fifth exercise 3-5 sets 12-15 repetitions"),
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
                                          placeholder: "assets/loading.gif",
                                          image: "https://thefitnessphantom.com/wp-content/uploads/2020/07/DUMBBELL-OVERHEAD-SHOULDER-PRESS.gif",
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
                  "Lateral raise",
                  style: GoogleFonts.anton(textStyle: TextStyle(fontSize: 30)),
                ),
                subtitle: Text("Sixth exercise 3-5 sets 12-15 repetitions"),
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
                                "Sixth exercise detail",
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
                                          placeholder: "assets/loading.gif",
                                          image: "https://4.bp.blogspot.com/-lvvLI_5Edhc/WHMpOb9Wc6I/AAAAAAAAJf4/Gokdb8BJ36As7v0WJrjBEbblS77wszcUQCLcB/s1600/www.GIFCreator.me_f0zZur.gif",
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
                  "Triceps Push Down",
                  style: GoogleFonts.anton(textStyle: TextStyle(fontSize: 30)),
                ),
                subtitle: Text("Seventh exercise  3-5 sets 12-15 repetitions"),
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
                                "Seventh exercise detail",
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
                                          placeholder: "assets/loading.gif",
                                          image: "https://i.pinimg.com/originals/19/91/27/1991278e895e7c384631c776de96b00d.gif",
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
                  "Biceps curl",
                  style: GoogleFonts.anton(textStyle: TextStyle(fontSize: 30)),
                ),
                subtitle: Text("Eighth exercise 3-5 sets 12-15 repetitions"),
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
                                "Eighth exercise detail",
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
                                          placeholder: "assets/loading.gif",
                                          image: "https://i.pinimg.com/originals/cb/6d/01/cb6d0141b13a5a18f99f032666b8b3b2.gif",
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
                  "Leg extension",
                  style: GoogleFonts.anton(textStyle: TextStyle(fontSize: 30)),
                ),
                subtitle: Text("Ninth exercise 3-5 sets 12-15 repetitions"),
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
                                "Ninth exercise detail",
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
                                          placeholder: "assets/loading.gif",
                                          image: "https://i.pinimg.com/originals/2f/88/8a/2f888a80d3e49f5e31ee372116437540.gif",
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
                  "Sit ups",
                  style: GoogleFonts.anton(textStyle: TextStyle(fontSize: 30)),
                ),
                subtitle: Text("Last exercise 3-5 sets 15 repetitions"),
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
                                "Tenth exercise detail",
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
                                          placeholder: "assets/loading.gif",
                                          image: "https://www.makeoverfitness.com/images/sit-ups.gif",
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
