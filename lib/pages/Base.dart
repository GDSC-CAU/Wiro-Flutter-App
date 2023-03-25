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
        height: 100,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: _curIndex == 0 ? Colors.blue : const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: Text("목록",
                    style: TextStyle(
                      color: _curIndex == 0 ? Colors.white : Colors.black,
                      fontSize: 35
                    )
                  )
                )
              ),
              label: "Mission"
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: _curIndex == 1 ? Colors.blue : const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: Text("알림",
                    style: TextStyle(
                      color: _curIndex == 1 ? Colors.white : Colors.black,
                      fontSize: 35
                    )
                  )
                )
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: _curIndex == 2 ? Colors.blue : const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: Text("대화",
                    style: TextStyle(
                      color: _curIndex == 2 ? Colors.white : Colors.black,
                      fontSize: 35
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

  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration.zero, () =>
    // Navigator.push((context), MaterialPageRoute(builder: (context) => LoginPage())));
  }
}
