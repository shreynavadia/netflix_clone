import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imdb_clone/Globals.dart';
import 'package:imdb_clone/Searchmodule/searchhome.dart';
import 'package:imdb_clone/whoswatchingscreen.dart';
import 'package:sticky_headers/sticky_headers.dart';

class homescreen extends StatefulWidget {
  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: StickyHeader(header: Row1(), content: maincolumn()),
      ),
    );
  }

  Widget maincolumn() {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row2(),
        const SizedBox(height: 20),
        HeroStack(),
        Padding(
          padding: const EdgeInsets.fromLTRB(0,20,90,5),
          child: CategoryStack(),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildcards(),
                  const SizedBox(width: 20),
                  buildcards1(),
                  const SizedBox(width: 20),
                  buildcards2(),
                  const SizedBox(width: 20),
                  buildcards3(),
                  const SizedBox(width: 20),
                  buildcards4(),
                ],
              )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0,20,260,5),
          child: CategoryStack1(),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildcards4(),
                  const SizedBox(width: 20),
                  buildcards3(),
                  const SizedBox(width: 20),
                  buildcards2(),
                  const SizedBox(width: 20),
                  buildcards1(),
                  const SizedBox(width: 20),
                  buildcards(),
                ],
              )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0,20,200,5),
          child: CategoryStack2(),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildcards5(),
                  const SizedBox(width: 20),
                  buildcards6(),
                  const SizedBox(width: 20),
                  buildcards7(),
                  const SizedBox(width: 20),
                  buildcards8(),
                  const SizedBox(width: 20),
                  buildcards9(),
                ],
              )),
        ),
      ],
    );
  }
  Widget buildcards() {
    return Container(
      height: 200,
      child: Image.network(
          "https://www.indiewire.com/wp-content/uploads/2017/09/arq-2016.jpg?w=674"),
    );
  }
  Widget buildcards1() {
    return Container(
      height: 200,
      child: Image.network(
          "https://www.indiewire.com/wp-content/uploads/2017/09/journey-to-greenland-2016.jpg?w=736"),
    );
  }
  Widget buildcards2() {
    return Container(
      height: 200,
      child: Image.network(
          "https://www.indiewire.com/wp-content/uploads/2017/09/mascots-2016.jpg?w=675"),
    );
  }
  Widget buildcards3() {
    return Container(
      height: 200,
      child: Image.network(
          "https://www.indiewire.com/wp-content/uploads/2017/09/sandy-wexler-2017.jpg?w=712"),
    );
  }
  Widget buildcards4() {
    return Container(
      height: 200,
      child: Image.network(
          "https://www.indiewire.com/wp-content/uploads/2017/09/to-the-bone-2017.jpg?w=674"),
    );
  }
  Widget buildcards5() {
    return Container(
      height: 300,
      child: Image.network(
          "https://www.indiewire.com/wp-content/uploads/2017/09/barry-2016.jpg?w=675"),
    );
  }
  Widget buildcards6() {
    return Container(
      height: 300,
      child: Image.network(
          "https://www.indiewire.com/wp-content/uploads/2017/09/crouching-tiger-hidden-dragon-sword-of-destiny-2016.jpg?w=675"),
    );
  }
  Widget buildcards7() {
    return Container(
      height: 300,
      child: Image.network(
          "https://www.indiewire.com/wp-content/uploads/2017/09/arq-2016.jpg?w=674"),
    );
  }
  Widget buildcards8() {
    return Container(
      height: 300,
      child: Image.network(
          "https://www.indiewire.com/wp-content/uploads/2017/09/the-do-over-2016.jpg?w=675"),
    );
  }
  Widget buildcards9() {
    return Container(
      height: 300,
      child: Image.network(
          "https://www.indiewire.com/wp-content/uploads/2017/09/mascots-2016.jpg?w=675"),
    );
  }
  Widget CategoryStack() {
    return h4whitetext("Emmy-Winning US TV Comedies");
  }
  Widget CategoryStack2() {
    return h3whitetext("Only on Netflix");
  }
  Widget CategoryStack1() {
    return h4whitetext("Trending Now");
  }
  Widget HeroStack() {
    return Stack(children: <Widget>[
      Container(
          height: 420,
          width: 330,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
                "https://www.indiewire.com/wp-content/uploads/2017/09/imperial-dreams-2014.jpg?w=426",
                fit: BoxFit.fill),
          )),
      Positioned(
        bottom: 10,
        left: 0,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 23),
                    const Icon(FontAwesomeIcons.play),
                    const SizedBox(width: 1),
                    TextButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent, // Background color
                      ),
                      child: h4buttontext("Play"),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              Container(
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    const Icon(FontAwesomeIcons.plus),
                    TextButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent, // Background color
                      ),
                      child: h4buttontext("My List"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
  Widget Row1() {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 35, 10, 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            headingwhitetext("For Jash"),
            const SizedBox(width: 100),
            const Icon(FontAwesomeIcons.chromecast,
                size: 35, color: Colors.white),
            const SizedBox(width: 23),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => searchhome()));
              },
              child: const Icon(FontAwesomeIcons.magnifyingGlass,
                  size: 30, color: Colors.white),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => home()));
              },
              child: SizedBox(
                  height: 35,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1),
                    child: Image.network("https://i.imgur.com/Kkaeq84.png"),
                  )),
            ),
          ],
        ),
      ),
    );
  }
  Widget Row2() {
    return Row(
      children: [
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white54,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: h4whitetext("TV Show"),
          ),
        ),
        const SizedBox(width: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white54,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: h4whitetext("Movies"),
          ),
        ),
        const SizedBox(width: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white54,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: h4whitetext("Categories"),
          ),
        ),
      ],
    );
  }

}
