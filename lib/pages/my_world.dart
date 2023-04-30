import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Achievement {
  final String description;
  final String title;

  Achievement({required this.description, required this.title});

  Map<String, dynamic> toJson() => {
        'description': description,
        'title': title,
      };
  Achievement.fromJson(Map<String, dynamic> json)
      : description = json['nome'],
        title = json['isDeleted'];
}

class MyWorld extends StatefulWidget {
  const MyWorld({super.key});

  @override
  State<MyWorld> createState() => _MyWorldState();
}

class _MyWorldState extends State<MyWorld> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  List<Achievement> achievements = [];

  void loadAchievements() {
    _prefs.then((SharedPreferences prefs) {
      String? stringa = prefs.getString('achievements');
      if (stringa != null) {
        List<dynamic> jsonList = jsonDecode(stringa);

        final List<Achievement> newAchivevements =
            jsonList.map((e) => Achievement.fromJson(e)).toList();
        setState(() {
          achievements = newAchivevements;
        });
      }
    });
  }

  void savedTodos(List<Achievement> achievements) {
    final json = jsonEncode(achievements.map((e) => e.toJson()).toList());
    _prefs.then((prefs) => prefs.setString('achievements', json));
  }

  void addAchievement() {
    setState(() {
      achievements.add(Achievement(
          description: 'aggiungi descrizione', title: 'aggiungi un titolo'));
      savedTodos(achievements);
    });
  }

  @override
  void initState() {
    super.initState();
    loadAchievements();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          
          onPressed: addAchievement,
        ),
        body: Container(
          child: ListView.builder(
            itemCount: achievements.length,
            itemBuilder: (context, index) {
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 2)),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(achievements[index].description),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ));
  }
}
