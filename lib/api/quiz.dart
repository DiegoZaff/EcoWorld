import 'dart:convert';

import 'package:http/http.dart' as http;

import 'baseurl.dart';

class Question {
  final String id;
  final String question;
  final List<String> answers;

  const Question(
      {required this.id, required this.question, required this.answers});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      question: json['title'],
      answers: json['options'].map<String>((e) => e.toString()).toList(),
    );
  }
}

class Answer {
  final String question;
  final String answer;
  const Answer({required this.question, required this.answer});

  static Map<String, dynamic> toJSON(Answer answer) {
    return {
      'question': answer.question,
      'answer': answer.answer,
    };
  }
}

Future<List<Question>> getQuiz() async {
  http.Response response =
      await http.get(Uri.http(baseUrl, '/game/random_quiz'));

  final json = jsonDecode(response.body);

  if (response.statusCode != 200) {
    throw Exception(json['message']);
  } else {
    final List<dynamic> json = jsonDecode(response.body);
    final l = json.map((e) => Question.fromJson(e));
    final q = l.toList();
    return q;
  }
}
