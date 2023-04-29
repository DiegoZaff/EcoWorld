import 'package:flutter/material.dart';

import 'personal_score.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key, required this.name, required this.surname});

  final String name;
  final String surname;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 64, 16, 0),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.person,
                  ),
                ),
                Text(
                  '$name\n$surname',
                  style: Theme.of(context).textTheme.titleMedium,
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
                children: [Icon(Icons.abc)],
              ),
            )
          ],
        ),
      ),
    );
  }
}
