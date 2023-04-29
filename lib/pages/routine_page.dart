import 'dart:ui';

import 'package:eco_app/components/domande_routine.dart';
import 'package:eco_app/components/title_page.dart';
import 'package:flutter/material.dart';

class Domanda {
  double value;
  String domanda;
  String id;
  Domanda({required this.value, required this.domanda, required this.id});
}

class Routine extends StatefulWidget {
  const Routine({super.key});

  @override
  State<Routine> createState() => _RoutineState();
}

class _RoutineState extends State<Routine> {
  double numerodomande = 5;
  List<Domanda> domande = [
    Domanda(value: 20, domanda: 'Did you take public transportation?', id: '1'),
    Domanda(value: 20, domanda: 'Did you eat local food?', id: '2'),
    Domanda(value: 20, domanda: 'Did you use a water bottle?', id: '3'),
    Domanda(
        value: 20,
        domanda: 'Did you pay attentions to turn off the lights when the room is empty?',
        id: '4'),
    Domanda(value: 20, domanda: 'Did you use recycle bins?', id: '5'),
    Domanda(
        value: 20,
        domanda: 'Did you pay attention while using tap water?',
        id: '6'),
  ];
  void onChanged(double value, String id) {
    setState(() {
      for (int i = 0; i < domande.length; i++) {
        if (domande[i].id == id) {
          domande[i].value = value;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double punti = 0;
    for (int i =0; i<domande.length; i++){
      punti = punti + domande[i].value;
    }
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/sfondofoglie.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const TitlePage(title: 'ROUTINE'),
            Container(
              height: 600,
              padding: const EdgeInsets.only(bottom: 25),
              child: ListView.builder(
                  itemCount: domande.length,
                  itemBuilder: (contex, i) {
                    return DomandeRoutine(
                        question: domande[i], onChanged: onChanged);
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                    onLongPress: null, //!
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, bottom: 20),
                      child: Text(
                        'FINISH',
                        style: TextStyle(
                            backgroundColor: Colors.white.withOpacity(0.7),
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.w700),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
