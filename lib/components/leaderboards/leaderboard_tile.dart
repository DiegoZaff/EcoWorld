import 'package:flutter/material.dart';

import '../../classes/user_leaderboard.dart';

class LeaderboardTile extends StatelessWidget {
  const LeaderboardTile({super.key, required this.user});

  final UserLeaderboard user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(user.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: user.isYou ? FontWeight.bold : null)),
              Text(
                "+ ${user.points}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: user.isYou ? FontWeight.bold : null),
              )
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
