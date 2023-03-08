import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("Home Page"),
        HomeTimeSetting()
      ]
    );
  }
}

class HomeTimeSetting extends StatefulWidget {
  const HomeTimeSetting({super.key});

  @override
  State<StatefulWidget> createState() => _TimeState();
}

class _TimeState extends State<HomeTimeSetting> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("Time Setting")
      ],
    );
  }
}