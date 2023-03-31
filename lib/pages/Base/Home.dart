import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;

import 'package:solutionchallengetem2_app/pages/Base.dart';
import 'package:solutionchallengetem2_app/pages/PrivacyEditPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max, children: const [
        Flexible(flex: 2, child: HomeTimeSetting()),
        Flexible(flex: 3, child: HomePrivacy())
      ]
    );
  }
}

class HomeTimeSetting extends StatefulWidget {
  const HomeTimeSetting({super.key});

  @override
  State<StatefulWidget> createState() => _TimeState();
}

class _TimeState extends State<HomeTimeSetting> {
  String _strNotiTimeAM = "";
  String _strNotiTimePM = "";

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _strNotiTimeAM = "10:00";
      _strNotiTimePM = "18:00";
    });

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(flex: 1, child: TimeCard(timeData: _strNotiTimeAM, timeType: "AM")),
        Flexible(flex: 1, child: TimeCard(timeData: _strNotiTimePM, timeType: "PM")),
      ],
    );
  }
}

class TimeCard extends StatelessWidget {
  const TimeCard({Key? key, required this.timeData, required this.timeType}): super(key: key);
  final String timeData;
  final String timeType;

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
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Text("${timeType == "AM" ? "오전" : "오후"} 알림 $timeData",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                height: 1
              )
            ),
          ),
        )
      )
    );
  }
}

class HomePrivacy extends StatefulWidget {
  const HomePrivacy({super.key});

  @override
  State<StatefulWidget> createState() => _PrivacyState();
}

class _PrivacyState extends State<HomePrivacy> {
  String _userToken = "";
  String _strPrivacyName = "";
  String _strPrivacyID = "";
  String _strPrivacyBlood = "";
  String _strPrivacyDisease = "";
  String _strPrivacyMedicine = "";

  void getData() async {
    BasePageState? baseState = context.findAncestorStateOfType<BasePageState>();
    _userToken = baseState!.userToken;
    final response = await http.get(
      Uri.parse("${FlutterConfig.get("API_URL")}/users/getUserInfo"),
      headers: {
        "Authorization": "Bearer $_userToken"
      }
    );

    var responseData = jsonDecode(response.body)["result"];
    setState(() {
      _strPrivacyName = responseData["nickname"] ?? "NAME";
      _strPrivacyID = responseData["id"] ?? "ID";
      _strPrivacyBlood = responseData["blood"] ?? "BLOOD";
      _strPrivacyDisease = responseData["disease"] ?? "DISEASE";
      _strPrivacyMedicine = responseData["medicine"] ?? "MEDICINE";
    });
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          flex: 1,
          child: PrivacyCard(
            userToken: _userToken,
            privacyName: _strPrivacyName,
            privacyID: _strPrivacyID,
            privacyBlood: _strPrivacyBlood,
            privacyDisease: _strPrivacyDisease,
            privacyMedicine: _strPrivacyMedicine
          )
        )
      ],
    );
  }
}

class PrivacyCard extends StatelessWidget {
  const PrivacyCard({Key? key,
    required this.userToken,
    required this.privacyName,
    required this.privacyID,
    required this.privacyBlood,
    required this.privacyDisease,
    required this.privacyMedicine}): super(key: key);

  final String userToken;

  final String privacyBlood;
  final String privacyDisease;
  final String privacyID;
  final String privacyName;
  final String privacyMedicine;

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
            child:
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Text("개인정보",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              height: 1
                            )
                          )
                        ),
                        IconButton(
                          onPressed: (){
                            Navigator.push((context), MaterialPageRoute(builder: (context) => PrivacyEditPage(userToken: userToken)));
                          },
                          icon: const Icon(Icons.settings)
                        )
                      ]
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const PrivacyCardTextTitle(textStr: "성함"),
                        PrivacyCardText(textStr: privacyName),
                        const PrivacyCardTextTitle(textStr: "주민등록번호"),
                        PrivacyCardText(textStr: privacyID),
                        const PrivacyCardTextTitle(textStr: "혈액형"),
                        PrivacyCardText(textStr: privacyBlood),
                        const PrivacyCardTextTitle(textStr: "지병"),
                        PrivacyCardText(textStr: privacyDisease),
                        const PrivacyCardTextTitle(textStr: "복용약"),
                        PrivacyCardText(textStr: privacyMedicine)
                      ],
                    )
                  )
                ]
              ),
            )
          )
        )
      )
    );
  }
}

class PrivacyCardText extends StatelessWidget {
  const PrivacyCardText({
    Key? key,
    required this.textStr
  }): super(key: key);

  final String textStr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        textStr,
        style: const TextStyle(
          fontSize: 30,
          height: 1
        )
      )
    );
  }
}

class PrivacyCardTextTitle extends StatelessWidget {
  const PrivacyCardTextTitle({
    Key? key,
    required this.textStr
  }): super(key: key);

  final String textStr;

  @override
  Widget build(BuildContext context) {
    return Text(
      textStr,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        height: 1
      )
    );
  }
}