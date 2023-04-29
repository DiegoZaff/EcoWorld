import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'tasks.dart';

class HomePageTile extends StatelessWidget {
  const HomePageTile(
      {super.key,
      this.onPress,
      required this.title,
      this.icon = Ionicons.sunny,
      this.isCompleted});

  final VoidCallback? onPress;
  final String title;
  final IoniconsData icon;
  final bool? isCompleted;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x40000000),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: const Color.fromARGB(255, 0, 191, 57),
                ),
                Tasks(title: title, points: 10, isCompleted: isCompleted),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
