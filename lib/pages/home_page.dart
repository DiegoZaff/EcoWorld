import 'dart:ui';
import 'package:eco_app/components/home_page_tile.dart';
import 'package:eco_app/components/user_info.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../api/challenge.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "Nome";
  String surname = "Cognome";

  List<DailyChallenge> challenges = [];

  @override
  void initState() {
    super.initState();
    loadChallenges();
  }

  void loadChallenges() async {
    final newChallenges = await getChallenges();
    setState(() {
      challenges = newChallenges;
    });
  }

  void _showModal(context, DailyChallenge challenge) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Material(
            type: MaterialType.transparency,
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        challenge.title,
                        style: const TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                      child: Text(
                        challenge.description,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/sfondofoglie.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Column(
            children: [
              const UserInfo(),
              const HomePageTile(
                title: "Quizzettone",
                icon: Ionicons.help_circle,
              ),
              const HomePageTile(
                title: "Daily Footprint",
                icon: Ionicons.footsteps,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return HomePageTile(
                    title: "Daily Challenge",
                    onPress: () => _showModal(context, challenges[index]),
                  );
                },
                itemCount: challenges.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
