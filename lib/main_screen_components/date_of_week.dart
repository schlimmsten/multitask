import 'package:flutter/material.dart';
//import 'date_builder.dart';

class DateOfWeek extends StatefulWidget {

  final String text;
  final bool isSelected;

  const DateOfWeek({super.key, required this.text, required this.isSelected});
  //const DateOfWeek({Key? key, required this.text, required this.isSelected}) : super(key: key);

  //хули тварь ругается / реши потом
  @override
  State<DateOfWeek> createState() => _DateOfWeekState(text, isSelected);
}

class _DateOfWeekState extends State<DateOfWeek> {

  final String text;
  final bool isSelected;

  _DateOfWeekState(this.text, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.only(left: 7),
    width: 55,
    child: TextButton(
      onPressed: () {
        //debugPrint("is pressed");
      },
      style: TextButton.styleFrom(
        shape: const CircleBorder(),
        ),
      child: Text(
        text,
        style: TextStyle( 
          fontSize: 18,
          fontFamily: "Montserrat",
          color: !isSelected ? Colors.black : Colors.blue.shade900,
          fontWeight: !isSelected ? FontWeight.normal : FontWeight.bold,
          ),
        textAlign: TextAlign.center
        ),
      ),
    );
  }
}