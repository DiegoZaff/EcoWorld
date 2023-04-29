import 'package:flutter/material.dart';

enum ButtonType {
  primary,
  secondary,
  destructive,
}

// ignore: must_be_immutable
class Button extends StatelessWidget {
  final ButtonType type;
  final String text;
  final Function onPressed;

  late Color color;

  Button({
    super.key,
    this.type = ButtonType.primary,
    required this.text,
    required this.onPressed,
  }) {
    switch (type) {
      case ButtonType.primary:
        color = const Color.fromARGB(255, 0, 191, 57);
        break;
      case ButtonType.secondary:
        // very desaturated green
        color = const Color.fromARGB(255, 125, 202, 148);
        break;
      case ButtonType.destructive:
        color = const Color.fromARGB(255, 238, 37, 37);
        break;
      default:
        color = const Color.fromARGB(255, 0, 191, 57);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
          margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: GestureDetector(
            onTap: () {
              onPressed();
            },
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          )),
    );
  }
}
