
import 'dart:convert';

import 'package:imdb_clone/Models/TitleDataModel.dart';
import 'package:imdb_clone/Searchmodule/Model.dart';
import 'package:http/http.dart' as http;

class APIService {
  static const authority = "imdb8.p.rapidapi.com";
  static const path = "/auto-complete";
  static const Map<String, String> _headers = {
    "x-rapidapi-key": "36b9e0e89fmshf4c0957c5b907e9p148c75jsn01113177a1e5",
    "x-rapidapi-host": "imdb8.p.rapidapi.com",
  };
}

class APIpathservice {
  static const authority = "imdb8.p.rapidapi.com";
  static const path = "/title/get-overview-details";
  static const Map<String, String> _headers = {
    "x-rapidapi-key": "36b9e0e89fmshf4c0957c5b907e9p148c75jsn01113177a1e5",
    "x-rapidapi-host": "imdb8.p.rapidapi.com",
  };
}



