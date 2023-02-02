import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imdb_clone/Searchmodule/searchhome.dart';
import 'package:imdb_clone/whoswatchingscreen.dart';
import 'package:sticky_headers/sticky_headers.dart';

class downhome extends StatefulWidget {
  @override
  State<downhome> createState() => _homescreenState();
}

class _homescreenState extends State<downhome> {
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
    return Center(
      child: Column(
        children: [
          SizedBox(height: 40),
          introtext(),
          SizedBox(height: 30),
          intropara(),
          SizedBox(height: 30),
          introimage(),
          SizedBox(height: 10),
          signupbutton(),
          whatyoucandownloadbutton(),
        ],
      ),
    );
  }


  Widget introimage () {
    return Container(
      height: 250,
      child :
      Image.network("https://imgtr.ee/images/2023/02/02/Mb44X.jpg")
    );
  }
  Widget intropara () {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30,0,30,0),
      child: Container(
        child: h4whitetext("We'll download a personalised selection of movies and "
            "shows for you, so there's always something to watch on your device."),
      ),
    );
  }
  Widget introtext () {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20,0,20,0),
      child: h3whitetext("Introducing Downloads For You"),
    );
  }
  Widget headingwhitetext(whitetext) {
    return Text(
      whitetext,
      style: GoogleFonts.robotoFlex(
          color: Colors.white,
          fontSize: 26,
          letterSpacing: 0.9,
          fontWeight: FontWeight.w700),
    );
  }
  Widget h4whitetext(whitetext) {
    return Text(
      whitetext,
      textAlign: TextAlign.center,
      style: GoogleFonts.robotoFlex(
          color: Color(0xb3999999),
          fontSize: 15,
          letterSpacing: 0.9,
          fontWeight: FontWeight.w700),
    );
  }
  Widget h3whitetext(whitetext) {
    return Text(
      whitetext,
      style: GoogleFonts.robotoFlex(
          color: Colors.white,
          fontSize: 22,
          letterSpacing: 0.9,
          fontWeight: FontWeight.w700),
    );
  }
  Widget h3blacktext(whitetext) {
    return Text(
      whitetext,
      style: GoogleFonts.robotoFlex(
          color: Colors.black,
          fontSize: 16,
          letterSpacing: 0.9,
          fontWeight: FontWeight.w900),
    );
  }
  Widget h4buttontext(blacktext) {
    return Text(
      blacktext,
      style: GoogleFonts.robotoFlex(
          color: Colors.black,
          fontSize: 18,
          letterSpacing: 1,
          fontWeight: FontWeight.w600),
    );
  }
  Widget Row1() {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 35, 10, 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            headingwhitetext("Downloads"),
            const SizedBox(width: 80),
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
  Widget signupbutton () {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35,20,35,20),
      child: Container(
        height: 44,
        width: 300,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color(0xe33C79F5),
        ),
        child: TextButton (
            onPressed: () {

            },
            child: h3whitetext("Set Up")
        ),
      ),
    );
  }
  Widget whatyoucandownloadbutton () {
    return Container(
      height: 44,
      width: 250,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color(0xffFCFDF2),
      ),
      child: TextButton (
          onPressed: () {

          },
          child: h3blacktext("See What You Can Download")
      ),
    );
  }

}
