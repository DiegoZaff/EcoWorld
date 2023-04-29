import 'package:eco_app/components/slider.dart';
import 'package:flutter/material.dart';

import '../pages/routine_page.dart';

class DomandeRoutine extends StatelessWidget {
  final void Function(double, String) onChanged;

  const DomandeRoutine({super.key, required this.question, required this.onChanged});
  final Domanda question;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).hoverColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                question.domanda,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            CustomSlider(onChanged: onChanged, currentSliderValue: question.value, id: question.id)
            
          ],
        ),
      ),
    );
  }
}
