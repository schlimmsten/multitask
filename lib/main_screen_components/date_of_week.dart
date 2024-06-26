import 'package:flutter/material.dart';
import '../text_style.dart';

class DateOfWeek extends StatelessWidget {
  final String day;
  final String date;
  final bool isSelected;
  final VoidCallback onPressed;

  const DateOfWeek({
    super.key,
    required this.date,
    required this.day,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: buttondayButtonStyle(context, isSelected),
      child: Text(
        "$day\n$date",
        style: dateofweekTextStyle(context, isSelected, day),
        textAlign: TextAlign.center,
      ),
    );
  }

  DateOfWeek copyWith({
    String? day,
    String? date,
    bool? isSelected,
    VoidCallback? onPressed,
  }) {
    return DateOfWeek(
      key: key,
      day: day ?? this.day,
      date: date ?? this.date,
      isSelected: isSelected ?? this.isSelected,
      onPressed: onPressed ?? this.onPressed,
    );
  }
}
