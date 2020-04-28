import 'package:flutter/material.dart';

class DayStats extends StatefulWidget {
  DayStats();

  @override
  _DayStatsState createState() => _DayStatsState();
}

class _DayStatsState extends State<DayStats> {
  int selectedIndex = 0;
  _DayStatsState();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      decoration: BoxDecoration(
        color: Colors.yellow,
        //borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        //color: Theme.of(context).accentColor,
      ),
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Padding(
                padding: EdgeInsets.only(left: 68.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                      child: selectedIndex == 0
                          ? Text(
                              "Today",
                              style: TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            )
                          : Text(
                              "Today",
                              style: TextStyle(
                                fontSize: 32.0,
                                letterSpacing: 1.0,
                              ),
                            ),
                    ),
                    SizedBox(
                      width: 18.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                      child: selectedIndex == 1
                          ? Text(
                              "Yesterday",
                              style: TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            )
                          : Text(
                              "Yesterday",
                              style: TextStyle(
                                fontSize: 32.0,
                                letterSpacing: 1.0,
                              ),
                            ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
