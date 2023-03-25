import 'package:flutter/material.dart';

class MissionPage extends StatelessWidget {
  const MissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: const [
        Flexible(flex: 1, child: MissionRecommendCard()),
        Flexible(flex: 2, child: MissionHistoryCard()),
        Flexible(flex: 2, child: CheckHistoryCard())
      ]
    );
  }
}

class MissionRecommendCard extends StatefulWidget {
  const MissionRecommendCard({super.key});

  @override
  State<StatefulWidget> createState() => _MissionRecommendCardState();
}

class _MissionRecommendCardState extends State<MissionRecommendCard> {
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
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
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
  const MissionHistoryCard({super.key});

  @override
  State<StatefulWidget> createState() => _MissionHistoryCardState();
}

class _MissionHistoryCardState extends State<MissionHistoryCard> {
  final List<String> _missionItemList = [];

  @override
  void setState(VoidCallback fn) {
    for(int i = 0; i < 5; i++){
      _missionItemList.add(i.toString());
    }

    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    setState((){});

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
                const Text("미션 기록",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    height: 1
                  )
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: (){
                        final List<Widget> itemWidgetList = [];
                        for(var item in _missionItemList){
                          itemWidgetList.add(
                            Padding(
                              padding: EdgeInsets.all(5.0),
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
              ]
            ),
          )
        )
      )
    );
  }
}

class CheckHistoryCard extends StatefulWidget {
  const CheckHistoryCard({super.key});

  @override
  State<StatefulWidget> createState() => _CheckHistoryCardState();
}

class _CheckHistoryCardState extends State<CheckHistoryCard> {
  final List<String> _chkItemList = [];

  @override
  void setState(VoidCallback fn) {
    for(int i = 0; i < 5; i++){
      _chkItemList.add(i.toString());
    }

    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    setState((){});

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
                const Text("체크리스트 기록",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    height: 1
                  )
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: (){
                        final List<Widget> itemWidgetList = [];
                        for(var item in _chkItemList){
                          itemWidgetList.add(
                            Padding(
                              padding: EdgeInsets.all(5.0),
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
              ]
            ),
          )
        )
      )
    );
  }
}