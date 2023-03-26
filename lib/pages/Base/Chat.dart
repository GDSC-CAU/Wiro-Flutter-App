import 'package:flutter/material.dart';
import 'package:solutionchallengetem2_app/pages/Base.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  String userToken = "";

  @override
  Widget build(BuildContext context) {
    BasePageState? baseState = context.findAncestorStateOfType<BasePageState>();
    userToken = baseState!.userToken;

    return Column(
      children: [
        const Flexible(flex: 1, child: ChatInfo()),
        Flexible(flex: 4, child: ChatHistory(userToken: userToken)),
        Flexible(flex: 1, child: ChatInput(userToken: userToken)),
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      child: SizedBox(
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
              child: ElevatedButton(
                onPressed: (){

                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return const Color(0xFFD5D5D5);
                      }
                      return const Color(0xFFF5F5F5);
                    }
                  )
                ),
                child: const Text("전화 걸기",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    height: 1
                  )
                ),
              )
            )
          ]
        )
      )
    );
  }
}

class ChatHistory extends StatefulWidget {
  const ChatHistory({super.key, required this.userToken});

  final String userToken;

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
    chatList.add({'sender': '이름', 'datetime': '내용', 'message': '시간'});
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: () {
              int i = 0;
              final List<Widget> chatItemList = [];
              for (var chatItem in chatList) {
                if (i % 2 == 0) {
                  chatItemList.add(ChatHistoryItem(chatData: chatItem, isFromMe: true));
                } else {
                  chatItemList.add(ChatHistoryItem(chatData: chatItem, isFromMe: false));
                }
                i++;
              }
              return chatItemList;
            }(),
          )
        )
      ),
    );
  }
}

class ChatHistoryItem extends StatelessWidget {
  const ChatHistoryItem({
    Key? key,
    required this.chatData,
    required this.isFromMe
  }): super(key: key);

  final bool isFromMe;
  final Map<String, String> chatData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 10.0),
              child: Text(
                chatData['sender']!,
                textAlign: isFromMe ? TextAlign.end : TextAlign.start,
                style: const TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 20,
                  height: 1
                )
              )
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: isFromMe ? const Color(0xFF001E99) : const Color(0xFFF5F5F5)
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                      child: Text(
                        chatData['message']!,
                        textAlign: isFromMe ? TextAlign.end : TextAlign.start,
                        style: TextStyle(
                          color: isFromMe ? const Color(0xFFFFFFFF) : const Color(0xFF000000),
                          fontSize: 30,
                          height: 1
                        )
                      )
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                      child: Text(
                        chatData['datetime']!,
                        textAlign: isFromMe ? TextAlign.end : TextAlign.start,
                        style: TextStyle(
                          color: isFromMe ? const Color(0xFFFFFFFF) : const Color(0xFF000000),
                          fontSize: 20,
                          height: 1
                        )
                      )
                    ),
                  )
                ],
              )
            )
          )
        ]
      )
    );
  }
}

class ChatInput extends StatefulWidget {
  const ChatInput({super.key, required this.userToken});

  final String userToken;

  @override
  State<StatefulWidget> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Row(
          children: [
            Flexible(
                flex: 8,
                child: TextField(
                  controller: inputController,
                  style: const TextStyle(
                      fontSize: 30
                  ),
                )
            ),
            Flexible(
                flex: 2,
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: IconButton(
                    onPressed: (){
                      print(inputController.text);
                    },
                    icon: const Icon(Icons.send, size: 40.0),
                  ),
                )
            )
          ],
        )
      ));
  }
}