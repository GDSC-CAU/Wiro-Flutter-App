import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;
import 'package:solutionchallengetem2_app/pages/Base.dart';

class MissionPage extends StatelessWidget {
  MissionPage({super.key});

  String userToken = "";

  @override
  Widget build(BuildContext context) {
    BasePageState? baseState = context.findAncestorStateOfType<BasePageState>();
    userToken = baseState!.userToken;

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(flex: 1, child: MissionRecommendCard(userToken: userToken)),
        Flexible(flex: 2, child: MissionHistoryCard(userToken: userToken)),
        Flexible(flex: 2, child: CheckHistoryCard(userToken: userToken))
      ]
    );
  }
}

class MissionRecommendCard extends StatefulWidget {
  const MissionRecommendCard({super.key, required this.userToken});

  final String userToken;

  @override
  State<StatefulWidget> createState() => _MissionRecommendCardState(userToken: userToken);
}

class _MissionRecommendCardState extends State<MissionRecommendCard> {
  _MissionRecommendCardState({required this.userToken});

  final String userToken;
  String _strRecommendMission = "";

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _strRecommendMission = "공원 산책";
    });

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
            child: Text("추천 : $_strRecommendMission",
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

class MissionHistoryCard extends StatefulWidget {
  const MissionHistoryCard({super.key, required this.userToken});

  final String userToken;

  @override
  State<StatefulWidget> createState() => _MissionHistoryCardState(userToken: userToken);
}

class _MissionHistoryCardState extends State<MissionHistoryCard> {
  _MissionHistoryCardState({required this.userToken});

  final String userToken;
  final List<String> _missionItemList = [];

  void getData() async {
    final response = await http.get(
        Uri.parse(FlutterConfig.get("API_URL") + "/mission/getMissionHistory"),
        headers: {
          "Authorization": "Bearer $userToken"
        }
    );

    var responseData = jsonDecode(response.body)["result"]["successMissions"];

    for(var item in responseData){
      final tmpResponse = await http.get(
          Uri.parse(FlutterConfig.get("API_URL") + "/mission/getMissionInfo/1101"), //${item["code"]}"),
          headers: {
            "Authorization": "Bearer $userToken"
          }
      );
      _missionItemList.add(jsonDecode(tmpResponse.body)["result"]["content"]);
    }
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child:
                  Text("미션 기록",
                    style: TextStyle(
                      fontSize: 40,
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
                                child: Text("Mission Item $item",
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
  State<StatefulWidget> createState() => _CheckHistoryCardState(userToken: userToken);
}

class _CheckHistoryCardState extends State<CheckHistoryCard> {
  _CheckHistoryCardState({required this.userToken});

  final String userToken;
  final List<String> _chkItemList = [];

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    setState((){
      for(int i = 0; i < 10; i++){
        _chkItemList.add(i.toString());
      }
    });

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
                      fontSize: 40,
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
                                child: Text("ChkList Item $item",
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