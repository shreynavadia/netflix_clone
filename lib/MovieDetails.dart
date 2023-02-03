import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:imdb_clone/Globals.dart';
import 'package:imdb_clone/Models/TitleDataModel.dart';
import 'package:imdb_clone/Navigation.dart';
import 'package:imdb_clone/Searchmodule/Model.dart';
import 'package:imdb_clone/Searchmodule/binding.dart';
import 'package:imdb_clone/Searchmodule/searchhome.dart';

class MovieDetails extends StatefulWidget {
  D item;

  MovieDetails(this.item);

  TitleData titem;

  @override
  State<MovieDetails> createState() => _homeState();
}

class _homeState extends State<MovieDetails> {
  TitleData titem;

  @override
  void initState() {
    super.initState();
    APIfetch(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 40),
          overlappedhero(widget.item),
          titleinfo(widget.item),
          PlayButton(),
          DownloadButton(),
          Divider(color: Colors.white),
          PlotOutline(widget.item),
        ],
      ),
    );
  }

  Widget PlotOutline(D item) {
    if (titem.plotSummary != null) {
      return  h4thinwhitetext(titem.plotSummary.text);
    }
    else {
      return h4thinwhitetext(titem.plotOutline.text);
    }
  }
  Widget overlappedhero(D item) {
    return Stack(children: [
      Align(
        alignment: Alignment.center,
        child: Container(
          height: 250,
          child: getImage(item),
        ),
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
  Widget titleinfo(D item) {
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
                h3whitetext(item.l),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                h5whitetext(titem.genres[0]),
                h5whitetext(item.y.toString()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               convertor(item),
                h5whitetext("Rating| " + titem.ratings.rating.toString()),

              ],
            ),
          ),
          Divider(height: 20, color: Colors.white),
        ],
      ),
    );
  }
  Widget convertor (D item) {
    if (titem.title.titleType == "movie") {
      int runtimeinhours = titem.title.runningTimeInMinutes ~/ 60 ;
      return h5whitetext(runtimeinhours.toString()+ " hrs ");
    }
    else  {
      return h5whitetext("Netflix Rank: " + titem.ratings.otherRanks[0].rank.toString());
    }


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
  Widget getImage(D item) {
    if (item.i != null && item.i.imageUrl != null) {
      return Container(
          color: Colors.white, child: Image.network(item.i.imageUrl));
    } else {
      return Container(
          color: Colors.white,
          child: Image.network(
              "https://images.ctfassets.net/4cd45et68cgf/Rx83JoRDMkYNlMC9MKzcB/2b14d5a59fc3937afd3f03191e19502d/Netflix-Symbol.png?w=684&h=456"));
    }
  }
  void APIfetch(D item) async {
    Map<String, String> _headers = {
      "x-rapidapi-key": "36b9e0e89fmshf4c0957c5b907e9p148c75jsn01113177a1e5",
      "x-rapidapi-host": "imdb8.p.rapidapi.com",
    };
    Uri uri = Uri.https(APIpathservice.authority, APIpathservice.path,
        {"tconst": item.id, "currentCountry": 'US'});
    final response = await http.get(uri, headers: _headers);
    if (response.statusCode == 200) {
      print(response.body.toString());
      final jsonMap = json.decode(response.body);
      var model = TitleData.fromJson(jsonMap);
      setState(() {
        titem = model;
      });
    } else {
      throw Exception(
          'API call returned: ${response.statusCode} ${response.reasonPhrase}');
    }
  }
}
