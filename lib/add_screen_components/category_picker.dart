import 'package:flutter/material.dart';
//можно как то пересобрать этот ужас?

List<Map<String, dynamic>> categories = [
  {"name": "Учеба", "color": Colors.red},
  {"name": "Работа", "color": Colors.green},
  {"name": "Развлечения", "color": Colors.blue},
  {"name": "Добавить свою", "color": Colors.orange},
];

class CategoryPicker extends StatelessWidget {
  const CategoryPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          child: const Text(
            "Выбрать категорию",
            style: TextStyle(
              fontSize: 18,
              fontFamily: "Montserrat",
              color: Colors.black,
            ),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  title: const Text(
                    'Выберите категорию',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Montserrat",
                      color: Colors.black,
                    ),
                  ),
                  children: categories.map((category) {
                    return SimpleDialogOption(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                              backgroundColor: category["color"], radius: 10),
                          const SizedBox(width: 10),
                          Text(
                            category["name"],
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: "Montserrat",
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
            );
          },
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
