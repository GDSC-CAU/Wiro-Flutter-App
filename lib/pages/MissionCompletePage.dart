import 'package:flutter/material.dart';

class MissionCompletePage extends StatelessWidget {
  const MissionCompletePage({super.key, required this.userToken});

  final String userToken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: const [
                Text("Mission Complete Page")
              ]
            )
          )
        )
      )
    );
  }
}