import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:imdb_clone/Models/TitleDataModel.dart';
import 'package:imdb_clone/MovieDetails.dart';
import 'package:imdb_clone/Navigation.dart';
import 'package:imdb_clone/Searchmodule/Model.dart';
import 'package:imdb_clone/Searchmodule/binding.dart';

class searchhome extends StatefulWidget {
  @override
  State<searchhome> createState() => _homeState();
}

class _homeState extends State<searchhome> {

  TextEditingController querycontroller = TextEditingController();
  List<D> d;

  @override
  void initState() {
    super.initState();
    getAPI("Silicon Valley");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Column(
        children: <Widget>[
          searchbar(),
          buildListview(),
        ],
      ),
    );
  }

  Widget searchbar () {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 35, 10, 20),
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Navigation()));
              },
              child: const Icon(FontAwesomeIcons.arrowLeft, color: Colors.grey, size: 30)),
          const SizedBox(width: 20),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xb3383838)),
            width: 270,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 19, 0, 0),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                cursorWidth: 3,
                cursorHeight: 30,
                controller: querycontroller,
                decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    hintText:"Search", fillColor: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 20),

          GestureDetector(
              onTap: () {
                getAPI(querycontroller.text);
                querycontroller.clear();
                FocusScope.of(context).unfocus;
              },
              child: const Icon (FontAwesomeIcons.magnifyingGlass, size: 30, color: Colors.grey)),
        ],
      ),
    );
  }
  Widget buildListview() {
    return _jobsListView(d);
  }
  Widget _jobsListView(List<D> items) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: items?.length,
          itemBuilder: (context, index) {
            return cardbuildup(context, items[index]);
          }),
    );
  }
  Widget cardbuildup(BuildContext context, D items) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MovieDetails(items)),
        );
      },

      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: const LinearGradient(colors: [
              Color(0x9920262E),
              Color(0x9920262E),
            ]),
          ),
          child: Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getImage(items),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(items.l,
                      softWrap: false,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(color: Colors.white, fontSize: 20)),
                ),
                const SizedBox(width: 15),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0,0,20,0),
                  child: Icon(FontAwesomeIcons.circlePlay, color: Colors.white, size:35),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget getImage(D items) {
    if (items.i != null && items.i.imageUrl != null) {
      return Container(
          color: Colors.white,
          height: 150,
          width: 67,
          child: Image.network(items.i.imageUrl));
    } else {
      return Container(
          color: Colors.white,
          height: 100,
          width: 60,
          child: Image.network("https://images.ctfassets.net/4cd45et68cgf/Rx83JoRDMkYNlMC9MKzcB/2b14d5a59fc3937afd3f03191e19502d/Netflix-Symbol.png?w=684&h=456"));
    }
  }
  void getAPI(String query) async {
    Map<String, String> _headers = {
      "x-rapidapi-key": "493f3fff12msh8787aa6a78c882ap10d955jsn6aed97183a15",
      "x-rapidapi-host": "imdb8.p.rapidapi.com",
    };
    Uri uri = Uri.https(APIService.authority, APIService.path, {"q": query});
    final response = await http.get(uri, headers: _headers);
    if (response.statusCode == 200) {
      print(response.body.toString());
      final jsonMap = json.decode(response.body);
      var model = imdbResponse.fromJson(jsonMap);
      setState(() {
        d = model.d;
      });
    } else {
      throw Exception(
          'API call returned: ${response.statusCode} ${response.reasonPhrase}');
    }
  }
}
