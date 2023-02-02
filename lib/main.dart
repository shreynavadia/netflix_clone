
import 'package:flutter/material.dart';
import 'package:imdb_clone/LoginUX/loginUX.dart';
import 'package:imdb_clone/whoswatchingscreen.dart';
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Netflix',
    home: netflix(),
  ));
}

class netflix extends StatelessWidget {
  const netflix();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: loginux()
    );
  }
}