import "package:flutter/material.dart";
import "pages/Chat.dart";
import "pages/Home.dart";
import "pages/Login.dart";
import "pages/Mission.dart";

void main() {
  runApp(const SCApp());
}

class SCApp extends StatelessWidget {
  const SCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Solution Challenge Team2",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppBase(title: "Solution Challenge Team2"),
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _pageOptions.elementAt(_curIndex),
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
