import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

import 'personal_score.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 64, 16, 0),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).primaryColor,
          boxShadow: const [
            BoxShadow(
              color: Color(0x40000000),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(
                    Ionicons.person_circle,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.push('/login');
                  },
                  child: Text(name,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white)),
                ),
                const Spacer(),
                const PersonalScore(
                  score: 100,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.go("/myworld");
                    },
                    child: Row(children: [
                      Image.asset("assets/images/earth.png"),
                      const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text("MyWorld",
                            style: TextStyle(color: Colors.white)),
                      )
                    ]),
                  ),
                  TextButton(
                      onPressed: () {
                        context.push("/leaderboards");
                      },
                      child: const Text(
                        "Leaderboard",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
