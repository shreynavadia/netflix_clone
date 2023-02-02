import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imdb_clone/LoginUX/LoginHome.dart';
import 'package:imdb_clone/LoginUX/loginUX.dart';
import 'package:imdb_clone/Navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';


class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
              top: 50,
              child: normalwhitetext("Who's Watching?")),
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row1(),
            SizedBox(height: 30),
            Row2(),
            SizedBox(height: 30),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Navigation()));
                  },
                  child: SizedBox(
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                            "https://i.imgur.com/HumsssB.png"),
                      )),
                ),
                SizedBox(height: 10),
                normalwhitetext("Dharmish.."),
              ],
            ),
            SizedBox(height: 50),
            LogoutButton(),
          ],
        ),
      ],
      ),
    );
  }


  Widget LogoutButton() {
    return  Container(
      width: 150,
      decoration: BoxDecoration (
        color: Color(0xe6fe0202),
      ),
      child: MaterialButton (
        onPressed: () async {
          final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
          sharedPreferences.remove('email');
          sharedPreferences.remove('password');
          Get.to(Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => loginux())));
        },
        child: h3whitetext("Log Out"),
      ),
    );
  }
  Widget h3whitetext(whitetext) {
    return Text(
      whitetext,
      style: GoogleFonts.robotoFlex(
          color: Colors.white,
          fontSize: 17,
          letterSpacing: 0.9,
          fontWeight: FontWeight.w600),
    );
  }
  Widget Row1 () {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Navigation()));
              },
              child: SizedBox(
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        "https://i.imgur.com/siylyIN.png" , fit: BoxFit.cover),
                  )),
            ),
            SizedBox(height: 10),
            normalwhitetext("Ashvin"),
          ],
        ),
        SizedBox(width: 20),
        Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Navigation()));
              },
              child: SizedBox(
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        "https://i.imgur.com/Kkaeq84.png"),
                  )),
            ),
            SizedBox(height: 10),
            normalwhitetext("Jash"),
          ],
        ),
      ],
    );
  }
  Widget Row2 () {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Navigation()));
              },
              child: SizedBox(
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        "https://i.imgur.com/t1CWBoj.png"),
                  )),
            ),
            SizedBox(height: 10),
            normalwhitetext("Vinrox"),
          ],
        ),
        SizedBox(width: 20),
        Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Navigation()));
              },
              child: SizedBox(
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        "https://i.imgur.com/i9kgLpg.png"),
                  )),
            ),
            SizedBox(height: 10),
            normalwhitetext("Shrey"),
          ],
        ),
      ],
    );
  }
  String whitetext;
  Widget normalwhitetext (whitetext) {
    return Text(
      whitetext, style: GoogleFonts.robotoFlex(color: Colors.white, fontSize: 18, letterSpacing: 0.7, fontWeight: FontWeight.w500),
    );
  }
}
