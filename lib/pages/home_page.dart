import 'package:eco_app/components/user_info.dart';
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
          )
        ],
      ),
    );
  }
}
