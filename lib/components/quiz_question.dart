import 'package:eco_app/api/quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class QuizQuestion extends HookWidget {
  final Question question;
  final void Function(String) onChanged;

  const QuizQuestion(
      {super.key, required this.question, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final selectedAnswer = useState<String?>(null);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 105, 121, 111),
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 8,
                  offset: Offset(0, 4),
                  // slightly green shadow
                  color: Color(0x40000000))
            ]),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            question.question,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          // map over the answers with radio buttons
          for (var answer in question.answers)
            Row(
              children: [
                Radio(
                  value: answer,
                  groupValue: selectedAnswer.value,
                  onChanged: (value) {
                    selectedAnswer.value = value as String;
                  },
                ),
                Expanded(
                  child: Text(
                    answer,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
        ]),
      ),
    );
  }
}
