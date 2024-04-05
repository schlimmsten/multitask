import 'package:flutter/material.dart';
import 'package:multitask/main_screen_components/main_screen_builder.dart';
import 'package:multitask/text_style.dart';
import '../screens/settings_screen.dart';
import '../themes/custom_theme.dart';
import 'package:provider/provider.dart';

var months = [
  'Январь',
  'Февраль',
  'Март',
  'Апрель',
  'Май',
  'Июнь',
  'Июль',
  'Август',
  'Сентябрь',
  'Октябрь',
  'Ноябрь',
  'Декабрь'
];

String currentMonthAndYear() {
  DateTime now = DateTime.now();
  int month = now.month;
  return '${months[month - 1]} ${now.year}';
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  late List<String> _appBarOptions;
  
  @override
  void initState() {
    super.initState();
    _updateAppBarOptions();
  }

  void _updateAppBarOptions() {
    _appBarOptions = [currentMonthAndYear(), "Расписание", "Настройки"];
  }

  static const List<Widget> _screenOptions = <Widget>[
    MainScreenBuilder(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //можно доработать добавив leading?

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomTheme>( 
      builder: (context, customTheme, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              _appBarOptions[_selectedIndex],
              style: headerTextStyle(),
            ),
            iconTheme: IconThemeData(color: customTheme.isDarkTheme ? Colors.white : const Color.fromARGB(255, 8, 4, 252)),
          ),
          body: _screenOptions[_selectedIndex],
          drawer: Drawer(
            width: 220,
            backgroundColor: customTheme.currentTheme.tabBarTheme.labelColor, // Использовать цвет из текущей темы
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.17,
                  child: DrawerHeader(
                    child: Row(
                      children: [
                        Image.asset(
                          Provider.of<CustomTheme>(context).isDarkTheme ? 'images/MT_white.png' : 'images/MT_blue.png',
                          width: 73,
                          height: 73,
                        ),
                        const SizedBox(width: 30),
                        Text(
                          'Multi\nTask',
                          style: TextStyle(
                            color: customTheme.currentTheme.primaryColor, // Использовать цвет из текущей темы
                            fontSize: 22,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Image.asset(
                        Provider.of<CustomTheme>(context).isDarkTheme ?'images/main_page_white.png':'images/main_page_blue.png',
                        width: 25,
                        height: 25,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Главное меню',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          fontFamily: "Montserrat",
                          color: _selectedIndex == 0
                              ? Provider.of<CustomTheme>(context).isDarkTheme ?
                              const Color.fromARGB(255, 78, 153, 240):
                              const Color.fromARGB(255, 8, 4, 252)
                              : Theme.of(context).textTheme.displayLarge?.color ??
                                  Colors.black,
                        ),
                      ),
                    ],
                  ),
                  selected: _selectedIndex == 0,
                  onTap: () {
                    _onItemTapped(0);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Image.asset(
                        Provider.of<CustomTheme>(context).isDarkTheme ?'images/schedule_white.png':'images/schedule_blue.png',
                        width: 25,
                        height: 25,
                      ),
                      const SizedBox(width: 9),
                      Text(
                        'Расписание',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          fontFamily: "Montserrat",
                          color: _selectedIndex == 1
                              ? Provider.of<CustomTheme>(context).isDarkTheme ?
                              const Color.fromARGB(255, 78, 153, 240):
                              const Color.fromARGB(255, 8, 4, 252)
                              : Theme.of(context).textTheme.displayLarge?.color ??
                                  Colors.black,
                        ),
                      ),
                    ],
                  ),
                  selected: _selectedIndex == 1,
                  onTap: () {
                    _onItemTapped(1);
                    Navigator.pop(context);
                  },
                ),
              Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.55),
                  child: ListTile(
                  title: Row(
                    children: <Widget>[
                      Image.asset(
                        Provider.of<CustomTheme>(context).isDarkTheme ?'images/settings_white.png':'images/settings_blue.png',
                        width: MediaQuery.of(context).size.width * 0.05, // 5% ширины экрана
                        height: MediaQuery.of(context).size.width * 0.05, // 5% ширины экрана
                      ),
                      const SizedBox(width: 9),
                      Text(
                        'Настройки',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          fontFamily: "Montserrat",
                          color: _selectedIndex == 2
                              ? Provider.of<CustomTheme>(context).isDarkTheme ?
                              const Color.fromARGB(255, 78, 153, 240):
                              const Color.fromARGB(255, 8, 4, 252)
                              : Theme.of(context).textTheme.displayLarge?.color ??
                                  Colors.black,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    _onItemTapped(2);
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      );
    },
  );
 }
}
