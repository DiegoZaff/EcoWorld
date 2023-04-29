import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'baseurl.dart';
import 'user.dart';

class DailyChallenge {
  final String id;
  final String title;
  final String description;
  final int points;
  bool? isCompleted;

  DailyChallenge(
      {required this.id,
      required this.title,
      required this.description,
      required this.points,
      this.isCompleted});

  factory DailyChallenge.fromJson(Map<String, dynamic> json) {
    return DailyChallenge(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      points: json['points'] as int,
    );
  }
}

Future<List<DailyChallenge>> getChallenges() async {
  http.Response response = await http.get(
      Uri.http(baseUrl, '/game/list_challenges'),
      headers: {'Content-Type': 'application/json'});

  final json = jsonDecode(response.body);

  if (response.statusCode != 200) {
    Fluttertoast.showToast(
      msg: json['message'],
      backgroundColor: const Color.fromARGB(255, 238, 37, 37),
    );

    throw Exception(json['message']);
  } else {
    final json = jsonDecode(response.body) as List<dynamic>;
    return json.map((e) => DailyChallenge.fromJson(e)).toList();
  }
}

Future<User> completeChallenge(String id, String authstring) async {
  String body = jsonEncode({'challengeId': id});

  http.Response response = await http.post(
      Uri.http(baseUrl, '/game/complete_challenge'),
      body: body,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': authstring
      });

  final json = jsonDecode(response.body);

  if (response.statusCode != 200) {
    Fluttertoast.showToast(
      msg: json['message'],
      backgroundColor: const Color.fromARGB(255, 238, 37, 37),
    );
    throw Exception(json['message']);
  } else {
    return User.fromJson(jsonDecode(response.body));
  }
}
