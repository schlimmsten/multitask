import 'package:flutter/material.dart';
import 'package:multitask/text_style.dart';
import 'package:multitask/screens/main_screen.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.blue.shade900, width: 2)),
      onPressed: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const MainScreen()));
      },
      child: Text(
        "Продолжить",
        style: smallTextStyle(),
      ),
    );
  }
}