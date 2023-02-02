import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:imdb_clone/LoginUX/LoginHome.dart';
import 'package:imdb_clone/whoswatchingscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginux extends StatefulWidget {
  @override
  State<loginux> createState() => _homescreenState();
}

class _homescreenState extends State<loginux> {
  @override

  void initState() {
    getValidationData().whenComplete(() => Get.to(finalEmail==null ?
    loginux() : Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => home()))));
    super.initState();
  }

  String finalEmail;
  String finalpassword;

  Future getValidationData() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainedemail = sharedPreferences.getString('email');
    var obtainedpassword = sharedPreferences.getString('password');
    setState(() {
      finalEmail = obtainedemail;
      finalpassword = obtainedpassword;
    });
    print(finalEmail);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            row1(),
            Slider(),
            LoginButton(),
          ],
        ));
  }

  Widget LoginButton() {
    return  Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration (
        color: Color(0xe6fe0202),
      ),
      child: TextButton (
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => loginhome()));
        },
        child: h3whitetext("SIGN IN"),
      ),
    );
  }
  Widget Slider() {
    return CarouselSlider(
      items: [
        Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage("https://i.ibb.co/1TJWgFn/IMG-0855.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage("https://i.ibb.co/Zmkdf96/IMG-0856.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage("https://i.ibb.co/DpyFLhb/IMG-0857.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
      options: CarouselOptions(
        height: 550.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 100),
        viewportFraction: 1,
      ),
    );
  }
  Widget row1() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 100,
                width: 100,
                child: Image.network(
                    "https://www.freepnglogos.com/uploads/netflix-logo-0.png")),
          ),
          SizedBox(
            width: 130,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: h3whitetext("Privacy"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: h3whitetext("Help"),
          )
        ]);
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
}
