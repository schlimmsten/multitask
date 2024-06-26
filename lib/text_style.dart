import 'package:flutter/material.dart';
import '../themes/custom_theme.dart';
import 'package:provider/provider.dart';

//Крч суть в очередном наследовании элементов. В самом начале общие стили,
//которые накладываются друг на друга за счет наследования, а потом при создании
//нового стиля для какого-то определенного элемента просто наследуем от уже созданных



TextStyle commonTextStyle(context) => const TextStyle(fontFamily: "Montserrat");
TextStyle blackwhiteTextStyle(context) => commonTextStyle(context).copyWith(
      color: Provider.of<CustomTheme>(context).isDarkTheme
          ? Colors.white
          : Colors.black,
    );
TextStyle alwaysblackTextStyle(context) => commonTextStyle(context).copyWith(
      color: Colors.black,
    );
TextStyle taskSectionTextStyle(context) => blackwhiteTextStyle(context).copyWith(
      fontSize: 21,
    );
TextStyle addbuttonTextStyle(context) => blackwhiteTextStyle(context).copyWith(
      fontSize: 20,
    );
TextStyle nameTaskTextStyle(context) => blackwhiteTextStyle(context).copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w900,
    );
TextStyle combinedStyle(BuildContext context) {
  final bool isDarkTheme = Provider.of<CustomTheme>(context).isDarkTheme;
  final Color? lineThroughColor = isDarkTheme ? Colors.grey[800] : Colors.black;
  
  return blackwhiteTextStyle(context).copyWith(
    fontSize: 21,
    fontWeight: FontWeight.w600,
    decorationColor: lineThroughColor,
    decoration: TextDecoration.lineThrough,
  );
}
Color? colorSelectedTasks(context){
  return Provider.of<CustomTheme>(context).isDarkTheme
          ? Colors.grey[600]
          : Colors.grey[300];
}
Color? colorTime(context){
  return Theme.of(context).primaryColor;
}
Color? colorLine(context, Color? color){
  return Provider.of<CustomTheme>(context).isDarkTheme
          ? Colors.grey[800]
          : Colors.grey[200];
}

TextStyle descriptionTextStyle(context, Color? color) => blackwhiteTextStyle(context).copyWith(
      
      fontSize: 15,
      color: color,
      fontWeight: FontWeight.w800,
    );
TextStyle selectedTimeTextStyle(context) => blackwhiteTextStyle(context).copyWith(
      fontSize: 18,
    );
TextStyle addtitlesTextStyle(context) => blackwhiteTextStyle(context).copyWith(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    );
TextStyle addfuelsTextStyle(context) => blackwhiteTextStyle(context).copyWith(
      fontSize: 16,
    );
TextStyle skipbuttonTextStyle(context) => commonTextStyle(context).copyWith(
    decoration: TextDecoration.underline,
    decorationColor: Colors.grey,
    fontSize: 18,
    color: Colors.grey);

TextStyle dateofweekTextStyle(context, bool isSelected, String day) =>
    commonTextStyle(context).copyWith(
      fontSize: 18,
      fontFamily: "Montserrat",
      color: ((day == 'СБ' || day == 'ВС') && !isSelected)
          ? Colors.red
          : (isSelected
              ? Theme.of(context).appBarTheme.backgroundColor
              : Provider.of<CustomTheme>(context).isDarkTheme
                  ? Colors.white
                  : Colors.black),
      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
    );
ButtonStyle buttondayButtonStyle(context, bool isSelected) => ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color?>(isSelected
        ? Theme.of(context).primaryColor
        : Theme.of(context).appBarTheme.backgroundColor),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    ),
    
    ),
    minimumSize: MaterialStateProperty.all<Size>(
    Size(MediaQuery.of(context).size.width * 0.137, MediaQuery.of(context).size.height * 0.09)), // Установите ширину и высоту по вашему усмотрению
  
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
    EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.006), // Горизонтальный отступ
  ),
    );

TextStyle toolbartitleTextStyle(context) => commonTextStyle(context).copyWith(
      color: Theme.of(context).primaryColor,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    );
TextStyle toolbar1TextStyle(context, int selectedIndex) =>
    commonTextStyle(context).copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 19,
      color: selectedIndex == 0
          ? const Color.fromARGB(255, 78, 153, 240)
          : Theme.of(context).textTheme.displayLarge?.color ?? Colors.black,
    );
TextStyle toolbar2TextStyle(context, int selectedIndex) =>
    commonTextStyle(context).copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 19,
      color: selectedIndex == 1
          ? const Color.fromARGB(255, 78, 153, 240)
          : Theme.of(context).textTheme.displayLarge?.color ?? Colors.black,
    );
TextStyle toolbar3TextStyle(context, int selectedIndex) =>
    commonTextStyle(context).copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 19,
      color: selectedIndex == 2
          ? const Color.fromARGB(255, 78, 153, 240)
          : Theme.of(context).textTheme.displayLarge?.color ?? Colors.black,
    );
TextStyle headerTextStyle(context) => blackwhiteTextStyle(context).copyWith(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    );
TextStyle mainTextStyle(context) => blackwhiteTextStyle(context).copyWith(
      fontSize: 21,
    );
TextStyle mainalwaysblackTextStyle(context) =>
    alwaysblackTextStyle(context).copyWith(
      fontSize: 21,
    );
TextStyle smallTextStyle(context) => blackwhiteTextStyle(context).copyWith(
      fontSize: 18,
    );
TextStyle smallalwaysblackTextStyle(context) =>
    alwaysblackTextStyle(context).copyWith(
      fontSize: 18,
    );
TextStyle settingsTextStyle(context) => blackwhiteTextStyle(context).copyWith(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

TextStyle redSmallTextStyle(context) => commonTextStyle(context).copyWith(
      fontSize: 18,
      color: Colors.red,
    );


Color? colorSelectedChange(context){
  return Provider.of<CustomTheme>(context).isDarkTheme
          ? Colors.white
          : const Color.fromARGB(255, 0, 0, 0);
}

TextStyle disciplineTextStyle(context) => blackwhiteTextStyle(context).copyWith(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);