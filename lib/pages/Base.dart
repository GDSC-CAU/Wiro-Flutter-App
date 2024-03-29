import "package:flutter/material.dart";

import 'Base/Chat.dart';
import 'Base/Home.dart';
import 'Base/Mission.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key, required this.userToken});

  final String userToken;

  @override
  State<BasePage> createState() => BasePageState();
}

class BasePageState extends State<BasePage> {
  int _curIndex = 1;

  final List<Widget> _pageOptions = <Widget>[
    const MissionPage(),
    const HomePage(),
    const ChatPage(),
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _curIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: _pageOptions.elementAt(_curIndex),
          )
        )
      ),
      bottomNavigationBar: SizedBox(
        height: 120,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 75,
                width: 85,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: _curIndex == 0 ? const Color(0xFF001E99) : const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: Center(
                    child: Text("LIST",
                      style: TextStyle(
                        color: _curIndex == 0 ? Colors.white : Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        height: 1
                      )
                    )
                  )
                )
              ),
              label: "Mission"
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 75,
                width: 85,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: _curIndex == 1 ? const Color(0xFF001E99) : const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: Center(
                    child: Text("HOME",
                      style: TextStyle(
                        color: _curIndex == 1 ? Colors.white : Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        height: 1
                      )
                    )
                  )
                )
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 75,
                width: 85,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: _curIndex == 2 ? const Color(0xFF001E99) : const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: Center(
                    child: Text("CHAT",
                      style: TextStyle(
                        color: _curIndex == 2 ? Colors.white : Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        height: 1
                      )
                    )
                  )
                )
              ),
              label: "Chat",
            ),
          ],
          currentIndex: _curIndex,
          selectedItemColor: Colors.blue,
          onTap: _onNavItemTapped,
        )
      )
    );
  }
}
