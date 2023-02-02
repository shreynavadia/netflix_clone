import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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
    style: GoogleFonts.robotoFlex(
        color: Colors.white,
        fontSize: 18,
        letterSpacing: 0.9,
        fontWeight: FontWeight.w700),
  );
}
Widget h5whitetext(whitetext) {
  return Text(
    whitetext,
    textAlign: TextAlign.justify,
    style: GoogleFonts.robotoFlex(
        color: Color(0xffECF9FF),
        fontSize: 13,
        letterSpacing: 0.9,
    )
  );
}
Widget h4blacktext(whitetext) {
  return Text(
    whitetext,
    style: GoogleFonts.robotoFlex(
        color: Colors.black,
        fontSize: 20,
        letterSpacing: 0.9,
        fontWeight: FontWeight.w700),
  );
}
Widget h3whitetext(whitetext) {
  return Text(
    whitetext,
    style: GoogleFonts.robotoFlex(
        color: Colors.white,
        fontSize: 25,
        letterSpacing: 0.9,
        fontWeight: FontWeight.w700),
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