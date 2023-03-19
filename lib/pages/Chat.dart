import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: const [
          Flexible(flex: 4, child: Text("Chat History")),
          Flexible(flex: 1, child: Text("Chat Input")),
        ]
    );
  }
}