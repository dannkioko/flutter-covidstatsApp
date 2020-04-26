import 'package:flutter/material.dart';
import 'package:flutterapp/models/stats_get.dart';

class StatsWidget extends StatefulWidget {
  final String searchQuery;
  StatsWidget(this.searchQuery);

  @override
  _StatsWidgetState createState() => _StatsWidgetState(searchQuery);
}

class _StatsWidgetState extends State<StatsWidget> {
  Future<Stats> futureStats;
  Stats stats;
  String searchQuery;
  _StatsWidgetState(this.searchQuery);
  @override
  void initState() {
    super.initState();
    futureStats = fetchStats(searchQuery);
  }

  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          child: FutureBuilder<Stats>(
              future: futureStats,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.only(
                                    left: 40.0, bottom: 10.0, top: 10.0),
                                child: Text(
                                  "New Cases",
                                  style: TextStyle(fontSize: 20.0),
                                )),
                            SizedBox(
                              width: 30.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 100.0),
                              child: Text(
                                snapshot.data.newCases == null
                                    ? "0"
                                    : snapshot.data.newCases,
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                padding:
                                    EdgeInsets.only(left: 40.0, bottom: 10.0),
                                child: Text(
                                  "Critical Cases",
                                  style: TextStyle(fontSize: 20.0),
                                )),
                            SizedBox(
                              width: 30.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 100.0),
                              child: Text(
                                snapshot.data.criticalCases == null
                                    ? "0"
                                    : "${snapshot.data.criticalCases}",
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.only(
                                  left: 40.0,
                                ),
                                child: Text(
                                  "Deaths",
                                  style: TextStyle(fontSize: 20.0),
                                )),
                            SizedBox(
                              width: 30.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 100.0),
                              child: Text(
                                snapshot.data.newDeaths == null
                                    ? "0"
                                    : "${snapshot.data.newDeaths}",
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.only(
                                    left: 40.0, bottom: 10.0, top: 10.0),
                                child: Text(
                                  "New Cases",
                                  style: TextStyle(fontSize: 20.0),
                                )),
                            SizedBox(
                              width: 30.0,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                padding:
                                    EdgeInsets.only(left: 40.0, bottom: 10.0),
                                child: Text(
                                  "Critical Cases",
                                  style: TextStyle(fontSize: 20.0),
                                )),
                            SizedBox(
                              width: 30.0,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.only(
                                  left: 40.0,
                                ),
                                child: Text(
                                  "Deaths",
                                  style: TextStyle(fontSize: 20.0),
                                )),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}
