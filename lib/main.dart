import "package:flutter/material.dart";
import "package:flutter_config/flutter_config.dart";
import "pages/Base.dart";
import "pages/Login.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  runApp(const SCApp());
}

class SCApp extends StatefulWidget {
  const SCApp({super.key});

  @override
  State<StatefulWidget> createState() => SCAppState();
}

class SCAppState extends State<SCApp> {
  bool isLoggedIn = false;
  String userToken = "";

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wiro - Solution Challenge Team2",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: isLoggedIn ? BasePage(userToken: userToken) : const LoginPage(),
    );
  }
}