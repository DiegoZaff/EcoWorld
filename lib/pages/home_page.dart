import 'dart:ui';
import 'package:eco_app/blocs/login/login_bloc.dart';
import 'package:eco_app/components/home_page_tile.dart';
import 'package:eco_app/components/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
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

  void updateChallengesStatus(String id) async {
    setState(() {
      for (int i = 0; i < challenges.length; i++) {
        if (challenges[i].id == id) {
          challenges[i].isCompleted = true;
        }
      }
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16),
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
                        children: [
                          IconButton(
                              onPressed: () async {
                                final state = context.read<LoginBloc>().state;
                                if (state is LoggedIn) {
                                  try {
                                    await completeChallenge(challenge.id,
                                            'Basic ${state.user.username}:${state.user.password}')
                                        .then((newUser) => context
                                            .read<LoginBloc>()
                                            .add(UpdateLogin(user: newUser)))
                                        .then((value) => context.pop())
                                        .then((value) => updateChallengesStatus(
                                            challenge.id));
                                  } catch (e) {
                                    //do nothing
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "You need to login first",
                                    backgroundColor:
                                        const Color.fromARGB(255, 238, 37, 37),
                                  );
                                }
                              },
                              icon: const Icon(
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.transparent,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
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
          child: Column(
            children: [
              const UserInfo(),
              HomePageTile(
                title: "Quiz",
                icon: Ionicons.help_circle,
                onPress: () => {context.push('/quiz')},
              ),
              HomePageTile(
                title: "Daily Footprint",
                icon: Ionicons.footsteps,
                onPress: () => {context.push('/routine')},
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return HomePageTile(
                    isCompleted: challenges[index].isCompleted,
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
