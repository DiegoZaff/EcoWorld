import 'dart:convert';
import 'dart:ui';
import 'package:eco_app/components/my_world/achievement_tile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyWorld extends StatefulWidget {
  const MyWorld({super.key});

  @override
  State<MyWorld> createState() => _MyWorldState();
}

class _MyWorldState extends State<MyWorld> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  List<Achievement> achievements = [];

  Future<void> loadAchievements() async {
    try {
      final prefs = await _prefs;

      String? stringa = prefs.getString('achievements');

      if (stringa != null) {
        List<dynamic> jsonList = jsonDecode(stringa);

        final List<Achievement> newAchivevements =
            jsonList.map((e) => Achievement.fromJson(e)).toList();
        setState(() {
          achievements = newAchivevements;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void saveAchievements(List<Achievement> achievements) {
    final json = jsonEncode(achievements.map((e) => e.toJson()).toList());
    _prefs.then((prefs) => prefs.setString('achievements', json));
  }

  void addAchievement() {
    setState(() {
      achievements.add(Achievement());
      saveAchievements(achievements);
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
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/sfondofoglie.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: SafeArea(
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'My World',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: achievements.length,
                    itemBuilder: (context, index) {
                      return AchievementTile(achievement: achievements[index]);
                    },
                  ),
                ),
              ]),
            ),
          ),
        ));
  }
}
