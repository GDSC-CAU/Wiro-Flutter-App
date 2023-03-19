import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: const [
          Flexible(flex: 1, child: ChatInfo()),
          Flexible(flex: 4, child: ChatHistory()),
          Flexible(flex: 1, child: ChatInput()),
        ]
    );
  }
}

class ChatInfo extends StatefulWidget {
  const ChatInfo({super.key});

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
  const ChatHistory({super.key});

  @override
  State<StatefulWidget> createState() => _ChatHistoryState();
}

class _ChatHistoryState extends State<ChatHistory> {
  @override
  Widget build(BuildContext context) {
    Map<String, String> chatData = {
      'sender': '발신자',
      'datetime': '202303191634',
      'message': '테스트메시지'
    };
    List<Map<String, String>> chatList = [];
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: () {
        final List<Widget> chatItemList = [];
        for (var chatItem in chatList){
          chatItemList.add(ChatHistoryItem(chatData: chatItem));
        }
        return chatItemList;
      }(),
    );
  }
}

class ChatHistoryItem extends StatelessWidget {
  const ChatHistoryItem({
    Key? key,
    required this.chatData
  }): super(key: key);

  final Map<String, String> chatData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(chatData['message']!),
        Text(chatData['sender']!),
        Text(chatData['datetime']!)
      ],
    );
  }
}

class ChatInput extends StatefulWidget {
  const ChatInput({super.key});

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