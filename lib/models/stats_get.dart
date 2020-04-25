import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Stats> fetchStats(String country) async {
  if (country == "") {
    throw Exception('Failed to load data');
  } else {
    final response = await http.get(
        'https://covid-193.p.rapidapi.com/statistics?country=$country',
        headers: {
          'x-rapidapi-key': '3bda545204msh485aa6b48016377p146018jsn543e0461cb80'
        });
    if (response.statusCode == 200) {
      return Stats.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class Stats {
  String countryName;
  int totalCases;
  int totalRecoverd;
  int deaths;
  int activeCases;
  String newCases;
  int criticalCases;
  String newDeaths;

  Stats({
    this.countryName,
    this.totalCases,
    this.totalRecoverd,
    this.deaths,
    this.activeCases,
    this.newCases,
    this.criticalCases,
    this.newDeaths,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      countryName: json['response'][0]['country'],
      totalCases: json['response'][0]['cases']['total'],
      totalRecoverd: json['response'][0]['cases']['recovered'],
      deaths: json['response'][0]['deaths']['total'],
      activeCases: json['response'][0]['cases']['active'],
      newCases: json['response'][0]['cases']['new'],
      criticalCases: json['response'][0]['cases']['critical'],
      newDeaths: json['response'][0]['deaths']['new'],
    );
  }
}
