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
    return SizedBox(
      height: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Flexible(
            flex: 7,
            child: Text(
              "사회복지사",
              style: TextStyle(
                fontSize: 30
              )
            )
          ),
          Flexible(
            flex: 3,
            child: IconButton(onPressed: (){
                print("");
              },
              icon: const Icon(Icons.call)
            )
          )
        ],
      )
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
    chatList.add({'sender': 'asdf', 'datetime': 'asdf', 'message': 'asdf'});
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add(chatData);
    chatList.add({'sender': 'qwer', 'datetime': 'qwer', 'message': 'qwre'});
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: () {
            final List<Widget> chatItemList = [];
            for (var chatItem in chatList){
              chatItemList.add(ChatHistoryItem(chatData: chatItem));
            }
            return chatItemList;
          }(),
        )
      ),
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
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                chatData['sender']!,
                style: const TextStyle(
                  fontSize: 20
                )
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                chatData['message']!,
                style: const TextStyle(
                  fontSize: 30
                )
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                chatData['datetime']!,
                style: const TextStyle(
                  fontSize: 20
                )
              ),
            )
          ],
        )
      )
    );
  }
}

class ChatInput extends StatefulWidget {
  const ChatInput({super.key});

  @override
  State<StatefulWidget> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            flex: 9,
            child: TextField(
              controller: inputController,
            )
        ),
        Flexible(
          flex: 1,
            child: IconButton(onPressed: (){
              print(inputController.text);
            }, icon: const Icon(Icons.send)
          )
        )
      ],
    );
  }
}