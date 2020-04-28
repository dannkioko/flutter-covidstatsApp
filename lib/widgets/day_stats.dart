import 'package:flutter/material.dart';
import 'package:flutterapp/models/stats_get.dart';

class StatsWidget extends StatelessWidget {
  final AsyncSnapshot<Stats> snapshot;
  StatsWidget(this.snapshot);
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            child: Container(
      child: snapshot.hasData == true
          ? Column(
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
                        "new",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(left: 40.0, bottom: 10.0),
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
                        "critical",
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
                        "deaths",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Column(
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
                        padding: EdgeInsets.only(left: 40.0, bottom: 10.0),
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
    )));
  }
}
