import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:covidstats/models/stats_get.dart';
import 'package:intl/intl.dart';

class DayStats extends StatefulWidget {
  Future<Stats> futureStats;
  String searchQuery;
  Function(Future<Stats>) callback;
  DayStats(this.searchQuery, this.callback);

  @override
  _DayStatsState createState() => _DayStatsState();
}

class _DayStatsState extends State<DayStats> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
      ),
      child: Row(
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
                          widget.callback(fetchStats(widget.searchQuery));
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
                          var date = DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days:1)));
                          widget.callback(fetchStats(widget.searchQuery,date));
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
