import "dart:async";
import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter_config/flutter_config.dart";
import "package:http/http.dart" as http;
import 'package:intl/intl.dart';
import "package:solutionchallengetem2_app/pages/Base.dart";

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
  State<StatefulWidget> createState() => _ChatHistoryState(userToken: userToken);
}

class _ChatHistoryState extends State<ChatHistory> {
  _ChatHistoryState({required this.userToken});

  final String userToken;
  List<Map<String, dynamic>> chatList = [];
  late Timer _chatLoadTimer;

  void getData() async {
    final response = await http.get(
      Uri.parse("${FlutterConfig.get("API_URL")}/chat/showChatMessages"),
      headers: {
        "Authorization": "Bearer $userToken"
      }
    );

    var responseData = jsonDecode(response.body)["result"];

    chatList.clear();
    for(var item in responseData){
      chatList.add({
        "sender": item["sourceNickname"],
        "datetime": item["updateTime"],
        "message": item["content"],
        "isFromMe": item["isFromMe"] == 1 ? 1 : 0
      });
    }
    setState(() {});

    print(response.body.toString());
  }

  @override
  void initState() {
    getData();
    _chatLoadTimer = Timer.periodic(
      const Duration(seconds: 2), (timer) {
        getData();
      }
    );
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  void deactivate() {
    _chatLoadTimer.cancel();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
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
              final List<Widget> chatItemList = [];
              for (var chatItem in chatList) {
                chatItemList.add(ChatHistoryItem(chatData: chatItem));
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
    required this.chatData
  }): super(key: key);

  final Map<String, dynamic> chatData;

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
                chatData["sender"]!,
                textAlign: chatData["isFromMe"] == 1 ? TextAlign.end : TextAlign.start,
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
              color: chatData["isFromMe"] == 1 ? const Color(0xFF001E99) : const Color(0xFFF5F5F5)
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
                        chatData["message"]!,
                        textAlign: chatData["isFromMe"] == 1 ? TextAlign.end : TextAlign.start,
                        style: TextStyle(
                          color: chatData["isFromMe"] == 1 ? const Color(0xFFFFFFFF) : const Color(0xFF000000),
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
                        chatData["datetime"]!,
                        textAlign: chatData["isFromMe"] == 1 ? TextAlign.end : TextAlign.start,
                        style: TextStyle(
                          color: chatData["isFromMe"] == 1 ? const Color(0xFFFFFFFF) : const Color(0xFF000000),
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
  State<StatefulWidget> createState() => _ChatInputState(userToken: userToken);
}

class _ChatInputState extends State<ChatInput> {
  _ChatInputState({required this.userToken});

  final userToken;
  final inputController = TextEditingController();

  void sendData(BuildContext context) async {
    final response = await http.post(
      Uri.parse("${FlutterConfig.get("API_URL")}/chat/sendMessage"),
      headers: {
        "Authorization": "Bearer $userToken",
        "Content-Type": "application/json"
      },
      body: jsonEncode({
        "content": inputController.text.toString(),
        "destinationNickname": "ADMIN"
      })
    );
    inputController.clear();

    print(response.body.toString());
  }

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
                    sendData(context);
                  },
                  icon: const Icon(Icons.send, size: 40.0),
                ),
              )
            )
          ],
        )
      )
    );
  }
}