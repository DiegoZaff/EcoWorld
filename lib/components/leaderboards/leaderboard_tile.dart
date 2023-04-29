import 'package:flutter/material.dart';

import '../../api/leaderboard.dart';

class LeaderboardTile extends StatelessWidget {
  const LeaderboardTile({super.key, required this.user});

  final UserLeaderboard user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 105, 121, 111),
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 8,
                  offset: Offset(0, 4),
                  // slightly green shadow
                  color: Color(0x40000000))
            ]),
        child: Column(children: [
          Row(children: [
            Text(
              user.username,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const Spacer(),
            Text(
              user.score.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 24,
              ),
            ),
          ]),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              color: const Color.fromARGB(255, 0, 191, 57),
              backgroundColor: Colors.white,
              minHeight: 8,
              value: user.score / 100,
            ),
          ),
        ]),
      ),
    );
  }
}
