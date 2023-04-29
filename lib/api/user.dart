import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

const String baseUrl =
    "ip172-18-0-30-ch6dmeae69v000ffank0-3000.direct.labs.play-with-docker.com";

class User {
  final String username;
  final String password;

  const User({required this.username, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'] as String,
      password: json['password'] as String,
    );
  }

  static Map<String, dynamic> toJson(User user) {
    return <String, dynamic>{
      'username': user.username,
      'password': user.password,
    };
  }
}

Future<User> registerUser(String username, String password) async {
  String body = jsonEncode({'username': username, 'password': password});

  http.Response response = await http.post(Uri.http(baseUrl, '/register'),
      body: body, headers: {'Content-Type': 'application/json'});

  Map<String, dynamic> json = jsonDecode(response.body);

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
