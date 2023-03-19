import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Flexible(flex: 1, child: ChatInfo()),
          Flexible(flex: 4, child: ChatHistory()),
          Flexible(flex: 1, child: ChatInput()),
        ]
    );
  }
}

class ChatInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatInfoState();
}

class _ChatInfoState extends State<ChatInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("Chat Info")
      ],
    );
  }
}

class ChatHistory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatHistoryState();
}

class _ChatHistoryState extends State<ChatHistory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("Chat History")
      ],
    );
  }
}

class ChatInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("Chat Input")
      ],
    );
  }
}