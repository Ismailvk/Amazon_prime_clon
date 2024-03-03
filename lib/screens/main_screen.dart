// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:amazon_prime_clone/screens/search_screen.dart';
import 'package:flutter/material.dart';

import 'download_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  // final pageList = [
  //   HomeScreen(movies: movies),
  //   DownloadScreen(),
  //   FindScreen(),
  // ];
  late final List<Widget> pageList;

  // @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }

  MainScreenState() {
    pageList = [
      HomeScreen(),
      DownloadScreen(),
      SearchScreen(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.white, // Selected tab icon color
        unselectedItemColor: Colors.grey, // Unselected tab icon color
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.file_download_outlined,
            ),
            label: 'Downloads',
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.search_sharp,
            ),
            label: 'Find',
          ),
        ],
      ),
    );
  }
}
