import 'package:flutter/material.dart';

class PrivacyEditPage extends StatelessWidget {
  const PrivacyEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [
              Text("Privacy Edit")
            ]
          )
        )
      )
    );
  }
}