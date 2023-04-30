import 'package:flutter/material.dart';

class Achievement {
  final String? description;
  final String? title;

  Achievement({this.description, this.title});

  Map<String, dynamic> toJson() => {
        'description': description,
        'title': title,
      };
  Achievement.fromJson(Map<String, dynamic> json)
      : description = json['description'],
        title = json['title'];
}

class AchievementTile extends StatefulWidget {
  const AchievementTile({super.key, required this.achievement});

  final Achievement achievement;

  @override
  State<AchievementTile> createState() => _AchievementTileState();
}

class _AchievementTileState extends State<AchievementTile> {
  late TextEditingController controllerTitle;
  late TextEditingController controllerDescription;

  @override
  void initState() {
    super.initState();
    controllerTitle = TextEditingController(text: widget.achievement.title);
    controllerDescription =
        TextEditingController(text: widget.achievement.description);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(alignment: Alignment.center, children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 6)),
            ),
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 6)),
            ),
          ]),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 16, bottom: 16, top: 16),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: TextField(
                    controller: controllerTitle,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Aggiungi un titolo',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 16)),
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: TextField(
                    controller: controllerDescription,
                    maxLines: null,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Aggiungi una descrizione',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14)),
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
