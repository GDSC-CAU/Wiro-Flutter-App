import 'package:flutter/material.dart';

void Home(){
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("Home Page")
      ]
    );
  }
}