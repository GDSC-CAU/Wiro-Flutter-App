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
            children: [
              PrivacyEditBack()
            ]
          )
        )
      )
    );
  }
}

class PrivacyEditBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: const Text("뒤로 가기",
            style: TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold
            ),
          )
        )
      ],
    );
  }
}