import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.color = const Color(0xFF3B58E0)});
  final String buttonText;
  final VoidCallback onPressed;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)))),
            backgroundColor: WidgetStatePropertyAll(color)),
        child: Center(
            child: Text(
          buttonText,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        )),
      ),
    );
  }
}
