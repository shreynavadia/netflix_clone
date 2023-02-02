import 'package:flutter/material.dart';
import 'package:imdb_clone/DownloadPage/DownPage.dart';
import 'package:imdb_clone/HomeScreen.dart';
import 'package:imdb_clone/MovieDetails.dart';
import 'package:imdb_clone/Searchmodule/searchhome.dart';

class Navigation extends StatefulWidget {
  @override
  State<Navigation> createState() => _homescreenState();
}

class _homescreenState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: bottomnavbar(context),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
    );
  }

  final List<Widget> _pages = <Widget>[
    homescreen(),
    searchhome(),
    downhome(),
    const Icon(
      Icons.play_arrow_outlined,
      size: 150,
    ),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Widget bottomnavbar(BuildContext context) {
    return Container(
      height: 70,
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        //New
        onTap: _onItemTapped,
        backgroundColor: const Color(0x597B8FA1),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_sharp, size: 35),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded, size: 35),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_downward_rounded, size: 35),
            label: 'Downloads',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow_outlined, size: 35),
            label: 'Coming Soon',
          ),
        ],
      ),
    );
  }
  }