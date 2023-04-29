import 'dart:convert';
import 'dart:ui';

import 'package:eco_app/api/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class UserLeaderboard {
  final String username;
  final int score;
  final bool isYou;

  UserLeaderboard(
      {required this.username, required this.score, this.isYou = false});

  factory UserLeaderboard.fromJson(Map<String, dynamic> json) {
    return UserLeaderboard(
      username: json['username'] as String,
      score: json['score'] as int,
      isYou: json['isYou'] as bool,
    );
  }
}

typedef Leaderboard = List<UserLeaderboard>;

Future<Leaderboard> fetchLeaderboard(String authstring) async {
  http.Response response = await http.get(
    Uri.http(baseUrl, '/game/leaderboard'),
    headers: {'Authorization': authstring},
  );

  final json = jsonDecode(response.body);

  if (response.statusCode != 200) {
    Fluttertoast.showToast(
      msg: json['message'],
      backgroundColor: const Color.fromARGB(255, 238, 37, 37),
    );

    throw Exception(json['message']);
  } else {
    final List<dynamic> json = jsonDecode(response.body);
    Leaderboard lb = json.map((u) => UserLeaderboard.fromJson(u)).toList();
    return lb;
  }
}
