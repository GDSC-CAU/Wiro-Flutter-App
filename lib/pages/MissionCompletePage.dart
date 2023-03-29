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
              Flexible(flex: 5, child: MissionCompletePageData()),
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
  @override
  State<StatefulWidget> createState() => MissionCompletePageDataState();
}

class MissionCompletePageDataState extends State<MissionCompletePageData> {
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
                children: const [
                  Text("Mission Complete Page Data")
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
  @override
  State<StatefulWidget> createState() => MissionCompletePageInputState();
}

class MissionCompletePageInputState extends State<MissionCompletePageInput> {
  @override
  Widget build(BuildContext context) {
    return Text("Mission Complete Page Input");
  }
}