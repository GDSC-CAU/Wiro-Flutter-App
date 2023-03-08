import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        HomeTimeSetting(),
        HomePrivacy()
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
      children: const [
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: SizedBox(
                width: double.infinity,
                child: Text("Morning Time Setting"),
              )
            )
          )
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            child: Card(
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text("Afternoon Time Setting"),
                    )
                )
            )
        ),
      ],
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
      children: const [
        Padding(
            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            child: Card(
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text("Privacy View"),
                    )
                )
            )
        )
      ],
    );
  }
}