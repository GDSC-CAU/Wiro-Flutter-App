import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: const [
        Flexible(flex: 1, child: HomeTimeSetting()),
        Flexible(flex: 1, child: HomePrivacy())
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
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: const [
        Flexible(flex: 1, child: TimeCard(timeData: "오전 10:00", timeType: "M")),
        Flexible(flex: 1, child: TimeCard(timeData: "오후 18:00", timeType: "A")),
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
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        child: Card(
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Text(timeData, style: TextStyle(fontSize: 50)),
                )
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
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: const [
        Flexible(flex: 1, child: PrivacyCard(
          privacyName: "이름",
          privacyID: "000000-1234567",
          privacyBlood: "A형",
          privacyDisease: "없음",
          privacyMedicine: "없음"
        ))
      ],
    );
  }
}

class PrivacyCard extends StatelessWidget {
  const PrivacyCard({Key? key,
    required this.privacyName,
    required this.privacyID,
    required this.privacyBlood,
    required this.privacyDisease,
    required this.privacyMedicine}): super(key: key);

  final String privacyBlood;
  final String privacyDisease;
  final String privacyID;
  final String privacyName;
  final String privacyMedicine;

  @override
  Widget build(BuildContext context) {
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
                      SizedBox(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text("Privacy View"),
                              IconButton(onPressed: (){}, icon: Icon(Icons.settings))
                            ]
                        )
                      ),
                      Text(privacyName),
                      Text(privacyID),
                      Text(privacyBlood),
                      Text(privacyDisease),
                      Text(privacyMedicine),
                    ]
                  ),
                )
            )
        )
    );
  }
}