import "dart:convert";
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import "package:http/http.dart" as http;

class MissionCompletePage extends StatelessWidget {
  const MissionCompletePage({super.key, required this.userToken, required this.missionCode});

  final String missionCode;
  final String userToken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Flexible(flex: 1, child: MissionCompletePageTitle()),
              Flexible(flex: 3, child: MissionCompletePageData(userToken: userToken, missionCode: missionCode)),
              Flexible(flex: 2, child: MissionCompletePageInput(userToken: userToken, missionCode: missionCode))
            ]
          )
        )
      )
    );
  }
}

class MissionCompletePageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("오늘의 미션 / 체크",
        style: TextStyle(
          color: Colors.black,
          fontSize: 40,
          fontWeight: FontWeight.bold
        )
      )
    );
  }
}

class MissionCompletePageData extends StatefulWidget {
  const MissionCompletePageData({super.key, required this.userToken, required this.missionCode});

  final String userToken;
  final String missionCode;

  @override
  State<StatefulWidget> createState() => MissionCompletePageDataState();
}

class MissionCompletePageDataState extends State<MissionCompletePageData> {
  String missionData = "";

  void getData() async {
    final response = await http.get(
      Uri.parse("${FlutterConfig.get("API_URL")}/mission/getMissionInfo/${widget.missionCode}"),
      headers: {
        "Authorization": "Bearer ${widget.userToken}"
      }
    );
    missionData = jsonDecode(response.body)["result"]["content"];

    setState(() {});

    print(response.body.toString());
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      child: Card(
        color: const Color(0xFFF5F5F5),
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(missionData,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30
                    )
                  )
                ]
              )
            )
          )
        )
      )
    );
  }
}

class MissionCompletePageInput extends StatefulWidget {
  const MissionCompletePageInput({super.key, required this.userToken, required this.missionCode});

  final String userToken;
  final String missionCode;

  @override
  State<StatefulWidget> createState() => MissionCompletePageInputState();
}

class MissionCompletePageInputState extends State<MissionCompletePageInput> {
  int _selButton = 2;

  void sendData() async {
    final response = await http.post(
        Uri.parse("${FlutterConfig.get("API_URL")}/mission/missionComplete"),
        headers: {
          "Authorization": "Bearer ${widget.userToken}",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          "code": widget.missionCode,
          "score": double.parse((_selButton * 0.25).toDouble().toStringAsFixed(1))
        })
    );

    print(response.body.toString());
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("◀ 부정",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30
                  )
                ),
                Text("긍정 ▶",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30
                  )
                )
              ]
            )
          )
        ),
        Flexible(
          flex: 2,
          child: Card(
            color: const Color(0xFFF5F5F5),
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 5
                      ),
                      color: _selButton == 0 ? const Color(0xFF001E99) : Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: (){
                        _selButton = 0;
                        setState(() {});
                      },
                    ),
                  ),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width: 5
                      ),
                      color: _selButton == 1 ? const Color(0xFF001E99) : Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: (){
                        _selButton = 1;
                        setState(() {});
                      },
                    ),
                  ),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width: 5
                      ),
                      color: _selButton == 2 ? const Color(0xFF001E99) : Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: (){
                        _selButton = 2;
                        setState(() {});
                      },
                    ),
                  ),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width: 5
                      ),
                      color: _selButton == 3 ? const Color(0xFF001E99) : Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: (){
                        _selButton = 3;
                        setState(() {});
                      },
                    ),
                  ),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width: 5
                      ),
                      color: _selButton == 4 ? const Color(0xFF001E99) : Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: (){
                        _selButton = 4;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              )
            )
          )
        ),
        Flexible(
          flex: 2,
          child: Card(
            color: const Color(0xFF001E99),
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)
            ),
            child: InkWell(
              onTap: sendData,
              child: const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Center(
                  child: Text("완료",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      height: 1
                    ),
                  )
                )
              )
            )
          )
        )
      ],
    );
  }
}