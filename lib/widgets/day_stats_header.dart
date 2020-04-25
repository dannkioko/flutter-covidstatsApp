import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/day_stats.dart';

class DayStats extends StatefulWidget {
  final String searchQuery;
  DayStats(this.searchQuery);

  @override
  _DayStatsState createState() => _DayStatsState(searchQuery);
}

class _DayStatsState extends State<DayStats> {
  int selectedIndex = 1;
  List<String> days = ["Today", "Tomorrow"];
  String searchQuery;

  _DayStatsState(this.searchQuery);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
        decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30.0),
    //borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
    color: Theme.of(context).accentColor,
        ),
        child: Column(
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(top: 10.0),
          //child: Padding(
            //padding: EdgeInsets.only(left: 68.0),
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
                          "Last 24hrs",
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        )
                      : Text(
                          "Last 24hrs",
                          style: TextStyle(
                            fontSize: 32.0,
                            letterSpacing: 1.0,
                          ),
                        ),
                ),
                // SizedBox(
                //   width: 18.0,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       selectedIndex = 1;
                //     });
                //   },
                //   child: selectedIndex == 1
                //       ? Text(
                //           "Yesterday",
                //           style: TextStyle(
                //             fontSize: 32.0,
                //             fontWeight: FontWeight.bold,
                //             letterSpacing: 1.0,
                //           ),
                //         )
                //       : Text(
                //           "Yesterday",
                //           style: TextStyle(
                //             fontSize: 32.0,
                //             letterSpacing: 1.0,
                //           ),
                //         ),
                // ),
              ],
            ),
          //)
          ),
          StatsWidget(searchQuery),
    ],
        ),
      );
  }
}