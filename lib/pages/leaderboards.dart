import 'package:eco_app/components/leaderboards/leaderboard_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../classes/user_leaderboard.dart';
import '../components/custom_pressable_button.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard(
      {super.key, this.teamLeaderboard, required this.globalLeaderboard});

  final List<UserLeaderboard>? teamLeaderboard;
  final List<UserLeaderboard> globalLeaderboard;

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  bool? isTeamLeaderboard = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.transparent,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 24,
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "LEADERBOARDS",
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomPressableButton(
                            onPressed: () => {
                              setState(() {
                                isTeamLeaderboard = true;
                              })
                            },
                            name: "TEAM",
                            width: 60,
                          ),
                        ]),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    child: Row(children: [
                      CustomPressableButton(
                        onPressed: () => {
                          setState(() {
                            isTeamLeaderboard = false;
                          })
                        },
                        name: "GLOBAL",
                        width: 60,
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            Expanded(
                child: (isTeamLeaderboard == true &&
                        widget.teamLeaderboard != null)
                    ? ListView.builder(
                        itemBuilder: (context, i) {
                          return LeaderboardTile(
                            user: widget.teamLeaderboard![i],
                          );
                        },
                        itemCount: widget.teamLeaderboard!.length,
                      )
                    : ListView.builder(
                        itemBuilder: (context, i) {
                          return LeaderboardTile(
                            user: widget.globalLeaderboard[i],
                          );
                        },
                        itemCount: widget.globalLeaderboard.length,
                      )),
          ],
        ),
      ),
    );
  }
}
