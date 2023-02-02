import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:imdb_clone/Globals.dart';
import 'package:imdb_clone/Navigation.dart';
import 'package:imdb_clone/Searchmodule/searchhome.dart';

class MovieDetails extends StatefulWidget {
  MovieDetails();

  @override
  State<MovieDetails> createState() => _homeState();
}

class _homeState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 40),
          overlappedhero(),
          titleinfo(),
          PlayButton(),
          DownloadButton(),
          Divider(color: Colors.white),
          PlotOutline(),
        ],
      ),
    );
  }


  Widget PlotOutline () {
    return h5whitetext("Stranger Things is set in the fictional rural town of Hawkins, Indiana, during the 1980s. The nearby Hawkins National Laboratory ostensibly performs scientific research for the United States Department of Energy, but secretly does experiments into the paranormal and supernatural, including those that involve human test subjects. Inadvertently, they have created a portal to an alternate dimension, the Upside Down. The influence of the Upside Down starts to affect the unknowing residents of Hawkins in calamitous ways");
  }
  Widget overlappedhero() {
    return Stack(children: [
      Container(
        child: Image.network("https://wallpaperaccess.com/full/712422.jpg"),
      ),
      Positioned(
          right: 12,
          top: 10,
          child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff20262E),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(FontAwesomeIcons.arrowLeft,
                        color: Colors.white)),
              ))),
    ]);
  }
  Widget titleinfo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                h3whitetext("Title here"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                h5whitetext("Genre"),
                h5whitetext("Year of Release"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                h5whitetext("Rating"),
                h5whitetext("Certificate"),
              ],
            ),
          ),
          Divider(height: 20, color: Colors.white),
        ],
      ),
    );
  }
  Widget PlayButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2)),
          color: Color(0xffF7F5F2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.play, color: Colors.black),
            TextButton(onPressed: () async {}, child: h4blacktext("Play")),
          ],
        ),
      ),
    );
  }
  Widget DownloadButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2)),
          color: Color(0xff20262E),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.file_download_outlined, color: Colors.white),
            TextButton(onPressed: () async {}, child: h4whitetext("Download")),
          ],
        ),
      ),
    );
  }
}
