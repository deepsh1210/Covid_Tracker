import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:covid_tracker/services/load.dart';
import 'package:covid_tracker/widgets/FirstHalf.dart';
import 'package:covid_tracker/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  List countryData;
  String mythBusterURL =
      'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters';

  void mythBustersLauncher() async {
    if (await canLaunch(mythBusterURL)) {
      launch(mythBusterURL);
    } else {
      throw 'INVALID';
    }
  }

  fetchCountryData() async {
    http.Response response =
        await http.get("https://corona.lmao.ninja/v2/countries");
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCountryData();
  }

  @override
  Widget build(BuildContext context) {
    return countryData == null
        ? Load()
        : Scaffold(
            backgroundColor: Color(0xFF473F97),
            body: Column(children: <Widget>[
              AspectRatio(
                aspectRatio: 12 / 15,
                child: Container(
                  color: Color(0xFF473F97),
                  padding:
                      EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 30),
                  child: FirstHalf(countryData: countryData),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      mythBustersLauncher();
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                      gradient: LinearGradient(
                        colors: colors1,
                        stops: stops,
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Image.asset(
                            'images/MythBuster-removebg-preview.png',
                            height: 200.0,
                            width: 150.0,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(40.0, 30.0, 20.0, 20.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'COVID-19',
                                style: TextStyle(
                                    fontSize: 32.0,
                                    letterSpacing: 1,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'BebasNeue'),
                              ),
                              Text(
                                'MYTH',
                                style: TextStyle(
                                    fontSize: 32.0,
                                    letterSpacing: 1,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'BebasNeue'),
                              ),
                              Text(
                                'BUSTERS',
                                style: TextStyle(
                                    fontSize: 32.0,
                                    color: Colors.black,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'BebasNeue'),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]),
          );
  }
}
