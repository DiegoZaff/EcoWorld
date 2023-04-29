import 'package:flutter/material.dart';

class DividerTile extends StatelessWidget {
  const DividerTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Divider(),
      Row(
        children: const [
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 8, 0, 8),
            child: Text(
              "Ranking",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
      const Divider()
    ]);
  }
}
