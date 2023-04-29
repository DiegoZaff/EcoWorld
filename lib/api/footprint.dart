import 'dart:convert';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'user.dart';
import 'package:http/http.dart' as http;

Future<User> sendCarbonFootprint(
    int punteggio, String username, String password) async {
  String authstring = 'Basic $username:$password';
  String body = jsonEncode({'newscore': punteggio});

  http.Response response = await http
      .post(Uri.http(baseUrl, '/game/carbon_footprint'), body: body, headers: {
    'Content-Type': 'application/json',
    'Authorization': authstring,
  });

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
