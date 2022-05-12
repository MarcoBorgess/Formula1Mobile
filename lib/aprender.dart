// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final now = DateTime.now();
final yearNow = now.year;

Future<Races> fetchRaces() async {
  var url = Uri.parse('https://ergast.com/api/f1/$yearNow.json');
  var response = await http.get(url);
  var json = jsonDecode(response.body);
  var races = Races.fromJson(json);

  return races;
}

Future<String> calcRaces() async {
  final races = await fetchRaces();

  if (races.toString().isNotEmpty) {
    return races.toString();
  } else {
    throw Exception('Falha ao carregar as corrdias');
  }
}

class Races {
  final int season;
  final int round;
  final String url;
  final String raceName;
  final String date;
  final String time;

  Races(
      {required this.season,
      required this.round,
      required this.url,
      required this.raceName,
      required this.date,
      required this.time});

  factory Races.fromJson(Map<String, dynamic> json) {
    return Races(
      season: json['season'],
      round: json['round'],
      url: json['url'],
      raceName: json['raceName'],
      date: json['date'],
      time: json['time'],
    );
  }
}

void main() {
  runApp(MyApp(futureRace: calcRaces()));
}

class MyApp extends StatelessWidget {
  final Future<String> futureRace;
  const MyApp({Key? key, required this.futureRace}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: Center(
          child: FutureBuilder<String>(
            future: futureRace,
            builder: (context, snapshot) {
              return const Text(
                'oi',
                style: TextStyle(color: Colors.white),
              );
            },
          ),
        ),
        backgroundColor: const Color.fromARGB(19, 21, 22, 1),
      ),
    );
  }
}
