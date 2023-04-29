import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Tasks extends StatelessWidget {
  const Tasks(
      {super.key,
      required this.title,
      required this.points,
      this.onPressed}); //da mettere il tempo

  final String title;

  final int points;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(),
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    )),
                const Spacer(),
                Container(
                    height: 15,
                    width: 15,
                    child: SvgPicture.asset(points <= 5
                        ? 'assets/icons/tree1.svg'
                        : points <= 10
                            ? 'assets/icons/tree2.svg'
                            : 'assets/icons/tree3.svg')),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    points.toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
