import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'baseurl.dart';

class User {
  final String username;
  final String password;
  final int score;

  const User(
      {required this.username, required this.password, required this.score});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'] as String,
      password: json['password'] as String,
      score: json['score'] as int,
    );
  }

  static Map<String, dynamic> toJson(User user) {
    return <String, dynamic>{
      'username': user.username,
      'password': user.password,
      'score': user.score,
    };
  }
}

Future<User> registerUser(String username, String password) async {
  String body = jsonEncode({'username': username, 'password': password});

  http.Response response = await http.post(Uri.http(baseUrl, '/auth/register'),
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

Future<User> logInUser(String username, String password) async {
  String body = jsonEncode({'username': username, 'password': password});

  http.Response response = await http.post(Uri.http(baseUrl, '/auth/login'),
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

/* Future<void> mockRequest(String authstring) async {
  http.Response response = await http
      .get(Uri.http(baseUrl, '/'), headers: {'Authorization': authstring});

  final json = jsonDecode(response.body);

  if (response.statusCode != 200) {
    Fluttertoast.showToast(
      msg: json['message'],
      backgroundColor: const Color.fromARGB(255, 238, 37, 37),
    );
  } else {
    Fluttertoast.showToast(
      msg: json['message'],
      backgroundColor: Color.fromARGB(255, 37, 238, 47),
    );
  }
} */
