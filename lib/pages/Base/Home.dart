import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: const [
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
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: const [
        Flexible(flex: 1, child: TimeCard(timeData: "10:00", timeType: "AM")),
        Flexible(flex: 1, child: TimeCard(timeData: "18:00", timeType: "PM")),
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
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: const [
        Flexible(flex: 1, child: PrivacyCard(
          privacyName: "김XX",
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
      padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      child: Card(
        color: const Color(0xFFF5F5F5),
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
                        const Text("개인정보",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.settings))
                      ]
                    )
                  ),
                  Column(
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
    return Text(
      textStr,
      style: const TextStyle(
        fontSize: 30
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
          fontSize: 20
        )
    );
  }
}