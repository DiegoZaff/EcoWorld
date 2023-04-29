import 'dart:ui';

import 'package:eco_app/components/home_page_tile.dart';
import 'package:eco_app/components/user_info.dart';
import 'package:eco_app/components/tasks.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../classes/challenge.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "Nome";
  String surname = "Cognome";

  List<Challenge> challenges = [
    Challenge(
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing",
        points: 15,
        title: 'Challenge Plastica'),
    Challenge(
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing, ",
        points: 5,
        title: "Challenge Sole"),
    Challenge(
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing,",
        points: 10,
        title: "Challenge della vita")
  ];

  void _showModal(context, Challenge challenge) {
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
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        challenge.description,
                        style: const TextStyle(color: Colors.black),
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
