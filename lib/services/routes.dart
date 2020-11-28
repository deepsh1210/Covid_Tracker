import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/Screens/Home_Screen.dart';
import 'package:covid_tracker/Screens/SearchCountry.dart';
import 'package:covid_tracker/Screens/CountryStats.dart';
import 'package:covid_tracker/Screens/UserInfo.dart';

class Routing extends StatefulWidget {
  @override
  _RoutingState createState() => _RoutingState();
}

class _RoutingState extends State<Routing> {
  final myPages = [HomeScreen(), Statistics(), CountryStats(), UserInfo()];
  int selectedPage = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          controller: pageController,
          children: myPages,
          onPageChanged: (index) {
            setState(
              () {
                selectedPage = index;
              },
            );
          },
        ),
        bottomNavigationBar: CurvedNavigationBar(
          height: 50.0,
          index: selectedPage,
          items: <Widget>[
            Icon(Icons.home, size: 30, color: Colors.white),
            Icon(Icons.insert_chart, size: 30, color: Colors.white),
            Icon(Icons.format_list_bulleted, size: 30, color: Colors.white),
            Icon(Icons.account_circle, size: 30, color: Colors.white),
          ],
          color: Color(0xFF473F97),
          buttonBackgroundColor: Colors.blueAccent,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOutCirc,
          animationDuration: Duration(milliseconds: 500),
          onTap: (index) {
            setState(() {
              selectedPage = index;

              pageController.animateToPage(selectedPage,
                  duration: Duration(milliseconds: 100), curve: Curves.linear);
            });
          },
        ),
      ),
    );
  }
}
