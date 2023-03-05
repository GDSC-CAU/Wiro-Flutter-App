import 'package:flutter/material.dart';

void Chat(){
  runApp(const ChatPage());
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("Chat Page")
      ]
    );
  }
}