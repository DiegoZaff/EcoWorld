import 'package:flutter/material.dart';

class CustomPressableButton extends StatelessWidget {
  const CustomPressableButton(
      {super.key, this.width, required this.name, this.onPressed});

  final String name;
  final double? width;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: SizedBox(
        width: width,
        child: Text(name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            )),
      ),
    );
  }
}
