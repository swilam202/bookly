import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.borderRadius,
    required this.text,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final Text text;
  final BorderRadius borderRadius;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextButton(

        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(foregroundColor),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(20),
          ),
        ),
        onPressed: onPressed,
        child: text,
      ),
    );
  }
}
