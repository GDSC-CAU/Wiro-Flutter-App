import 'package:flutter/material.dart';

void main() {
  runApp(const SCApp());
}

class SCApp extends StatelessWidget {
  const SCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppBase(title: 'Flutter Demo Home Page'),
    );
  }
}

class AppBase extends StatefulWidget {
  const AppBase({super.key, required this.title});

  final String title;

  @override
  State<AppBase> createState() => _AppBaseState();
}

class _AppBaseState extends State<AppBase> {
  int _curIndex = 1;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Mission Page',
      style: optionStyle,
    ),
    Text(
      'Home Page',
      style: optionStyle,
    ),
    Text(
      'Chat Page',
      style: optionStyle,
    ),
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _curIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_curIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Missions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
        currentIndex: _curIndex,
        selectedItemColor: Colors.blue,
        onTap: _onNavItemTapped,
      ),
    );
  }
}
