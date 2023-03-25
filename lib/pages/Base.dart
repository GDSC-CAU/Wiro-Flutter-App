import "package:flutter/material.dart";
import 'Base/Chat.dart';
import 'Base/Home.dart';
import 'Base/Mission.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _curIndex = 1;

  static const List<Widget> _pageOptions = <Widget>[
    MissionPage(),
    HomePage(),
    ChatPage(),
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _curIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: _pageOptions.elementAt(_curIndex),
          )
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Missions",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chat",
          ),
        ],
        currentIndex: _curIndex,
        selectedItemColor: Colors.blue,
        onTap: _onNavItemTapped,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration.zero, () =>
    // Navigator.push((context), MaterialPageRoute(builder: (context) => LoginPage())));
  }
}
