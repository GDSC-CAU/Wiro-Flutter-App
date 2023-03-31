import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;

import 'package:solutionchallengetem2_app/pages/Base.dart';
import 'package:solutionchallengetem2_app/pages/MissionCompletePage.dart';

class MissionPage extends StatelessWidget {
  const MissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    BasePageState? baseState = context.findAncestorStateOfType<BasePageState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(flex: 2, child: MissionRecommendCard(userToken: baseState!.widget.userToken)),
        Flexible(flex: 3, child: MissionHistoryCard(userToken: baseState.widget.userToken)),
        Flexible(flex: 3, child: CheckHistoryCard(userToken: baseState.widget.userToken))
      ]
    );
  }
}

class MissionRecommendCard extends StatefulWidget {
  const MissionRecommendCard({super.key, required this.userToken});

  final String userToken;

  @override
  State<StatefulWidget> createState() => _MissionRecommendCardState();
}

class _MissionRecommendCardState extends State<MissionRecommendCard> {
  String _strRecommendMission = "";
  String _strRecommendMissionCode = "";

  void getData() async {
    final response = await http.get(
        Uri.parse("${FlutterConfig.get("API_URL")}/mission/getRecommendMission"),
        headers: {
          "Authorization": "Bearer ${widget.userToken}"
        }
    );

    var responseData = (jsonDecode(response.body))["result"];
    _strRecommendMission = responseData[0]["content"];
    _strRecommendMissionCode = responseData[0]["code"];
    setState(() {});
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
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MissionCompletePage(userToken: widget.userToken, missionCode: _strRecommendMissionCode)));
          },
          borderRadius: BorderRadius.circular(30.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text("추천 미션",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        height: 1
                      )
                    )
                  ),
                  Center(
                    child: Text(_strRecommendMission,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        height: 1
                      )
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

class MissionHistoryCard extends StatefulWidget {
  const MissionHistoryCard({super.key, required this.userToken});

  final String userToken;

  @override
  State<StatefulWidget> createState() => _MissionHistoryCardState();
}

class _MissionHistoryCardState extends State<MissionHistoryCard> {
  final List<String> _missionItemList = [];

  void getData() async {
    final response = await http.get(
      Uri.parse("${FlutterConfig.get("API_URL")}/mission/getMissionHistory"),
      headers: {
        "Authorization": "Bearer ${widget.userToken}"
      }
    );

    var responseData = jsonDecode(response.body)["result"]["successMissions"];

    for(var item in responseData){
      final tmpResponse = await http.get(
        Uri.parse("${FlutterConfig.get("API_URL")}/mission/getMissionInfo/1101"), //${item["code"]}"),
        headers: {
          "Authorization": "Bearer ${widget.userToken}"
        }
      );
      _missionItemList.add(jsonDecode(tmpResponse.body)["result"]["content"]);
    }
    setState(() {});
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child:
                  Text("미션 기록",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      height: 1
                    )
                  )
                ),
                Expanded(
                  child: SizedBox.expand(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: (){
                          final List<Widget> itemWidgetList = [];
                          for(var item in _missionItemList){
                            itemWidgetList.add(
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(item,
                                  style: const TextStyle(
                                    fontSize: 25,
                                    height: 1
                                  )
                                )
                              )
                            );
                          }
                          return itemWidgetList;
                        }()
                      ),
                    ),
                  )
                )
              ]
            ),
          )
        )
      )
    );
  }
}

class CheckHistoryCard extends StatefulWidget {
  const CheckHistoryCard({super.key, required this.userToken});

  final String userToken;

  @override
  State<StatefulWidget> createState() => _CheckHistoryCardState();
}

class _CheckHistoryCardState extends State<CheckHistoryCard> {
  final List<String> _chkItemList = [];

  void getData() async {
    final response = await http.get(
      Uri.parse("${FlutterConfig.get("API_URL")}/mission/getCheckListHistory"),
      headers: {
        "Authorization": "Bearer ${widget.userToken}"
      }
    );

    var responseData = jsonDecode(response.body)["result"]["successCheckLists"];

    for(var item in responseData){
      final tmpResponse = await http.get(
        Uri.parse("${FlutterConfig.get("API_URL")}/mission/getMissionInfo/2101"), //${item["code"]}"),
        headers: {
          "Authorization": "Bearer ${widget.userToken}"
        }
      );
      _chkItemList.add(jsonDecode(tmpResponse.body)["result"]["content"]);
    }
    setState(() {});
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text("체크리스트 기록",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      height: 1
                    )
                  )
                ),
                Expanded(
                  child: SizedBox.expand(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: (){
                          final List<Widget> itemWidgetList = [];
                          for(var item in _chkItemList){
                            itemWidgetList.add(
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(item,
                                  style: const TextStyle(
                                    fontSize: 25,
                                    height: 1
                                  )
                                )
                              )
                            );
                          }
                          return itemWidgetList;
                        }()
                      ),
                    ),
                  )
                )
              ]
            ),
          )
        )
      )
    );
  }
}