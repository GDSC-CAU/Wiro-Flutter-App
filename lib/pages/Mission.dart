import 'package:flutter/material.dart';

void Mission(){
  runApp(const MissionPage());
}

class MissionPage extends StatelessWidget {
  const MissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("Mission Page")
      ]
    );
  }
}