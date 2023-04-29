import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class PersonalScore extends StatelessWidget {
  const PersonalScore({super.key, required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Ionicons.flower_sharp),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            score.toString(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        )
      ],
    );
  }
}
