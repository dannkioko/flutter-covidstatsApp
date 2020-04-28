import 'package:flutter/material.dart';
import 'package:covidstats/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(
        accentColor: Colors.white70,
        primaryColor: Colors.white,
      ),
    );
  }
}
