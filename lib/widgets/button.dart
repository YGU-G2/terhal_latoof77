import 'package:flutter/material.dart';
import 'package:terhal/utils/constants.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.text, required this.onPressed, this.width});
  final String text;
  final VoidCallback onPressed;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 45,
      child: MaterialButton(
        onPressed: onPressed,
        color: Color.fromARGB(255, 126, 107, 4),
        textColor: Color.fromARGB(255, 25, 3, 107),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(text, style: TextStyle(
          fontSize: 15,
        )),
      ),
    );
  }
}
