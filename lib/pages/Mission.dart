import 'package:flutter/material.dart';

class MissionPage extends StatelessWidget {
  const MissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        MissionRecommendCard(),
        MissionHistoryCard(),
        CheckHistoryCard()
      ]
    );
  }
}

class MissionRecommendCard extends StatefulWidget {
  const MissionRecommendCard({super.key});

  @override
  State<StatefulWidget> createState() => MissionRecommendCardState();
}

class MissionRecommendCardState extends State<MissionRecommendCard> {
  @override
  Widget build(BuildContext context) {
    return const Text("Mission Recommendation Card");
  }
}

class MissionHistoryCard extends StatefulWidget {
  const MissionHistoryCard({super.key});

  @override
  State<StatefulWidget> createState() => MissionHistoryCardState();
}

class MissionHistoryCardState extends State<MissionHistoryCard> {
  @override
  Widget build(BuildContext context) {
    return const Text("Mission History Card");
  }
}

class CheckHistoryCard extends StatefulWidget {
  const CheckHistoryCard({super.key});

  @override
  State<StatefulWidget> createState() => CheckHistoryCardState();
}

class CheckHistoryCardState extends State<CheckHistoryCard> {
  @override
  Widget build(BuildContext context) {
    return const Text("Check History Card");
  }
}