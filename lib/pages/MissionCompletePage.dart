import 'package:flutter/material.dart';

class MissionCompletePage extends StatelessWidget {
  const MissionCompletePage({super.key, required this.userToken});

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
              Flexible(flex: 4, child: MissionCompletePageData()),
              Flexible(flex: 1, child: MissionCompletePageInput())
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
    return Text("Mission Complete Page Title");
  }
}

class MissionCompletePageData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MissionCompletePageDataState();
}

class MissionCompletePageDataState extends State<MissionCompletePageData> {
  @override
  Widget build(BuildContext context) {
    return Text("Mission Complete Page Data");
  }
}

class MissionCompletePageInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MissionCompletePageInputState();
}

class MissionCompletePageInputState extends State<MissionCompletePageInput> {
  @override
  Widget build(BuildContext context) {
    return Text("Mission Complete Page Input");
  }
}