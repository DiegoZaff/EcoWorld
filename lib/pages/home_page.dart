import 'package:eco_app/components/user_info.dart';
import 'package:eco_app/components/tasks.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "Nome";
  String surname = "Cognome";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          UserInfo(
            name: name,
            surname: surname,
          ),
          Container(
            color: Colors.white54,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: Row(
                children: const [
                  Icon(
                    Icons.description_outlined,
                    color: Colors.blue,
                  ),
                  Tasks(title: 'Quizzettone', points: 15),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white54,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Row(
                children: const [
                  Icon(
                    Icons.face,
                    color: Colors.blue,
                  ),
                  Tasks(title: 'Daily Footprint', points: 5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
