import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PushPullLegs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Push-pull-legs workout",
          style: GoogleFonts.bigShouldersDisplay(
              textStyle: TextStyle(color: Colors.white, fontSize: 40)),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Card(
              child: ListTile(
                tileColor: Colors.black,
                leading: Icon(Icons.today),
                title: Text(
                  "Push day",
                  style: GoogleFonts.anton(textStyle: TextStyle(fontSize: 30)),
                ),
                subtitle: Text("Chest-shoulder-triceps day"),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.fitness_center),
                title: Text(
                  "Incline dumbbell press",
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
                                          image:
                                              "https://fitnessmajlis.com/Data/Exercise/Images/170_4incline_dumbbell_press.gif",
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
                  "Bench press",
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
                                          image:
                                              "https://fitnessmajlis.com/Data/Exercise/Images/159_4bench_press.gif",
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
                  "Dumbbell fly",
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
                                          image:
                                              "https://i.pinimg.com/originals/d3/08/61/d30861c5f26a1ecadd961a2749844d9e.gif",
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
                  "Shoulder press",
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
                                          image:
                                              "https://thefitnessphantom.com/wp-content/uploads/2020/07/DUMBBELL-OVERHEAD-SHOULDER-PRESS.gif",
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
                subtitle: Text("Fifth 3-5 sets 12-15 repetitions"),
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
                                          image:
                                              "https://4.bp.blogspot.com/-lvvLI_5Edhc/WHMpOb9Wc6I/AAAAAAAAJf4/Gokdb8BJ36As7v0WJrjBEbblS77wszcUQCLcB/s1600/www.GIFCreator.me_f0zZur.gif",
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
                subtitle: Text("Sixth exercise  3-5 sets 12-15 repetitions"),
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
                                          image:
                                              "https://i.pinimg.com/originals/19/91/27/1991278e895e7c384631c776de96b00d.gif",
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
                  "Dips (optional)",
                  style: GoogleFonts.anton(textStyle: TextStyle(fontSize: 30)),
                ),
                subtitle: Text("Seventh exercise 3-5 sets 12-15 repetitions"),
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
                                          image:
                                              "https://i.pinimg.com/originals/97/b3/25/97b3251a90fc2ea6f9b55bf630aef76e.gif",
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
            Divider(thickness: 5, color: Colors.white),
            Card(
              child: ListTile(
                tileColor: Colors.black,
                leading: Icon(Icons.today),
                title: Text(
                  "Pull day",
                  style: GoogleFonts.anton(textStyle: TextStyle(fontSize: 30)),
                ),
                subtitle: Text("Back-biceps day"),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.fitness_center),
                title: Text(
                  " Lat pull down",
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
                                          image:
                                              "https://computerscience.johncabot.edu/mscaramastra/F2017/CS130-2/Petrucci/THE%20STRONGER%20THE%20HAPPIER/latmachine.gif",
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
                  "Dumbbell pull over",
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
                                          image: "https://i.pinimg.com/originals/5c/48/75/5c487542f1a26cd3326320ebd3167292.gif",
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
                  "Rear delt fly",
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
                                          image: "https://bodyforumu.com/wp-content/uploads/2020/12/rear-deltoid.gif",
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
                  "Hammer curl",
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
                                          image: "https://thefitnessphantom.com/wp-content/uploads/2020/09/Hammer-Curl.gif",
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
                  "Leg day",
                  style: GoogleFonts.anton(textStyle: TextStyle(fontSize: 30)),
                ),
                subtitle: Text("Quads hamstrings day"),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.fitness_center),
                title: Text(
                  "Leg extension",
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
                  "Leg press",
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
                                          image: "https://i.pinimg.com/originals/d3/80/fe/d380fe1bc2200f919ab4cb1f28a5bdd0.gif",
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
                  "Lying leg curl",
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
                                          image: "https://www.fitnessandbeast.com/wp-content/uploads/2016/02/Lying-leg-curl-gif.gif",
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
                  "Walking lunges",
                  style: GoogleFonts.anton(textStyle: TextStyle(fontSize: 30)),
                ),
                subtitle:
                    Text("Fourth exercise 3-5 sets 12 repetitions per leg"),
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
                                          image: "https://1.bp.blogspot.com/-9fFy-a7i4h4/XTSdZMmf7TI/AAAAAAAAFaA/-biqniCOQp0L1ILwTjtrvBHwLEd-plulgCEwYBhgL/s1600/images.jpg",
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
                  "Calf raise",
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
                                          image: "https://static.gymhero.me/everkinetics/seated_calf_raise_using_machine-small-frame_2.png",
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
                  "Calf press",
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
                                          image: "https://weighteasyloss.com/wp-content/uploads/2020/05/Calf-raise-press-machine.gif",
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
