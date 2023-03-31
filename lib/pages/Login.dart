import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import 'package:solutionchallengetem2_app/main.dart';
import '../firebase_options.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool _isBtnEnabled = false;
  SCAppState? scApp;

  @override
  Widget build(BuildContext context) {
    scApp = context.findAncestorStateOfType<SCAppState>();

    return Scaffold(
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: _isBtnEnabled ? [
              LoginPageLogo(),
              ElevatedButton(
                onPressed: tryGoogleLogin,
                child: const Text("Login with Google")
              )
            ] : [
              LoginPageLogo()
            ]
          )
        )
      )
    );
  }

  @override
  void initState() {
    super.initState();
    checkLastLogin();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  void checkLastLogin() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) async {
      if(user != null && scApp != null){
        String userName = user.displayName.toString();
        String userToken = await user.getIdToken(false);
        String userUID = user.uid.toString();

        FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
          RemoteNotification? notification = message.notification;
          var androidNotiDetails = AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
          );
          var details = NotificationDetails(android: androidNotiDetails);
          if (notification != null) {
            flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              details,
            );
          }
        });

        await FirebaseMessaging.instance.subscribeToTopic(userUID);
        FirebaseMessaging.onMessageOpenedApp.listen((message) async {
          print(message);
        });

        registerUser(userName, userToken);
        scApp!.setState(() {
          scApp!.isLoggedIn = true;
          scApp!.userToken = userToken;
        });
      }else{
        setState(() {
          _isBtnEnabled = true;
        });
      }
    });
  }

  Future<void> tryGoogleLogin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void registerUser(String? userName, String userToken) async {
    final response = await http.post(
      Uri.parse("${FlutterConfig.get("API_URL")}/users/login"),
      headers: {
        "Authorization": "Bearer $userToken",
        "Content-Type": "application/json"
      },
      body: jsonEncode({
        "nickname": userName
      })
    );

    print(response.body.toString());
  }
}

class LoginPageLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Image(
        image: AssetImage("assets/Wiro_Logo.png")
      )
    );
  }
}