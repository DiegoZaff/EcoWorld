import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 20),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(title, style: const TextStyle(color: Colors.black, fontSize: 34, fontWeight: FontWeight.w600),) ],
    
        ),
      );
  }
}