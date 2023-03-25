import "package:flutter/material.dart";
import "pages/Base.dart";
import "pages/Login.dart";

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
      home: const BasePage(),
    );
  }
}