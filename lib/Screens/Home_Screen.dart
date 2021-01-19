import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/constants.dart';
import 'package:covid_tracker/widgets/HomeScreeText.dart';
import 'package:covid_tracker/widgets/HomeScreenButtons.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String ownTestUrl = 'https://www.youtube.com/watch?v=9WayjX6vCdk';

  void ownTestLauncher() async {
    if (await canLaunch(ownTestUrl)) {
      launch(ownTestUrl);
    } else {
      throw 'INVALID';
    }
  }

  void callLauncher(int number) async {
    String stringNumber = number.toString();
    String url = 'tel:$stringNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not place call';
    }
  }

  void smsLauncher(int number) async {
    String stringNumber = number.toString();
    String url = 'sms:$stringNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not place call';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 10 / 8,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF473F97),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
              ),
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width / 20.55),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width / 11.74),
                      child: Row(
                        children: <Widget>[
                          TextWidget('Covid-19', 30.0, Colors.white),
                          Spacer(),
                          Container(
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              shadows: [
                                BoxShadow(color: Colors.grey),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width / 41.1),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    'images/globe.png',
                                    scale: 2,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width /
                                        41.1,
                                  ),
                                  Text(
                                    'Global  ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.0),
                    TextWidget('Are you feeling sick ?', 25.0, Colors.white),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 20.55,
                    ),
                    TextWidget(
                      hugeText,
                      16.0,
                      Colors.white70,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 13.7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        HomeScreenButtons(
                          icon: Icons.call,
                          colour: Colors.redAccent,
                          text: 'Call',
                          onPressed: () {
                            setState(
                              () {
                                callLauncher(02224024353);
                              },
                            );
                          },
                        ),
                        HomeScreenButtons(
                          icon: Icons.sms,
                          colour: Colors.blue,
                          text: 'SMS',
                          onPressed: () {
                            setState(() {
                              smsLauncher(02224024353);
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width / 15),
                child: TextWidget('PREVENTION', 40.0, Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Image.asset(
                        'images/closeContact.png',
                        height: MediaQuery.of(context).size.width / 4,
                      ),
                      Text(
                        'Avoid Close',
                      ),
                      Text(' Contact')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Image.asset(
                        'images/washHands.jpg',
                        height: MediaQuery.of(context).size.width / 4,
                      ),
                      Text(
                        'Clean your hands',
                      ),
                      Text(
                        'often',
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Image.asset(
                        'images/faceMask.png',
                        height: MediaQuery.of(context).size.width / 4,
                      ),
                      Text(
                        'Wear a',
                      ),
                      Text(
                        'facemask',
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                child: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width / 20),
                  child: Container(
                    height: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: LinearGradient(
                        colors: colors,
                        stops: stops,
                      ),
                    ),
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'images/ownTest.png',
                            height: MediaQuery.of(context).size.width / 3.42,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width /
                                        20.55),
                                child: Text(
                                  'Do your own test!',
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.width / 20.55,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width /
                                        20.55),
                                child: Text(
                                  'Follow the instructions to do ',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width /
                                        20.55),
                                child: Text(
                                  'your own test.',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    ownTestLauncher();
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
