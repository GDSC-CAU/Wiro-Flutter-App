import 'package:flutter/material.dart';

class MissionPage extends StatelessWidget {
  const MissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: const [
          Flexible(flex: 1, child: MissionRecommendCard()),
          Flexible(flex: 2, child: MissionHistoryCard()),
          Flexible(flex: 2, child: CheckHistoryCard())
        ]
      )
    );
  }
}

class MissionRecommendCard extends StatefulWidget {
  const MissionRecommendCard({super.key});

  @override
  State<StatefulWidget> createState() => _MissionRecommendCardState();
}

class _MissionRecommendCardState extends State<MissionRecommendCard> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Text("추천 : 공원 산책",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 50
                )
              )
            ),
          )
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
  List<String> _missionItemList = [];

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
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("미션 기록",
                  style: TextStyle(
                    fontSize: 40
                  )
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: (){
                        final List<Widget> itemWidgetList = [];
                        for(var item in _missionItemList){
                          itemWidgetList.add(
                            Text("Mission Item $item",
                              style: const TextStyle(
                                fontSize: 20
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
  List<String> _chkItemList = [];

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
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("체크리스트 기록",
                  style: TextStyle(
                    fontSize: 40
                  )
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: (){
                        final List<Widget> itemWidgetList = [];
                        for(var item in _chkItemList){
                          itemWidgetList.add(
                            Text("ChkList Item $item",
                              style: const TextStyle(
                                fontSize: 20
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