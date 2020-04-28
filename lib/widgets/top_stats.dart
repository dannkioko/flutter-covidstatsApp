import 'package:flutter/material.dart';
import 'package:covidstats/models/stats_get.dart';

class TopStats extends StatelessWidget {
  final AsyncSnapshot<Stats> snapshot;
  TopStats(this.snapshot);
  @override
  Widget build(BuildContext context) {
    if (snapshot.hasData) {
      return Container(
        height: 320.0,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 30.0, top: 20.0),
              child: Text(
                  snapshot.data.countryName == null
                      ? ""
                      : snapshot.data.countryName,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  )),
            ),
            Column(
              children: <Widget>[
                Text(
                  "Total Cases",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    bottom: 5.0,
                  ),
                  child: Text("${snapshot.data.totalCases}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Text(
                  "Active Cases",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    bottom: 5.0,
                  ),
                  child: Text("${snapshot.data.activeCases}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Recovered",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "${snapshot.data.totalRecoverd}",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Deaths",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "${snapshot.data.deaths}",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        height: 320.0,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 30.0, top: 20.0),
              child: Text("",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  )),
            ),
            Column(
              children: <Widget>[
                Text(
                  "Total Cases",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    bottom: 5.0,
                  ),
                  child: Text("",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Text(
                  "Active Cases",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    bottom: 5.0,
                  ),
                  child: Text("",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Recovered",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Deaths",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
  }
}
