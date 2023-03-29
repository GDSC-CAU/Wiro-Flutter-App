import "package:firebase_messaging/firebase_messaging.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_config/flutter_config.dart";
import "package:flutter_local_notifications/flutter_local_notifications.dart";
import 'package:solutionchallengetem2_app/firebase_options.dart';
import "pages/Base.dart";
import "pages/Login.dart";

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message ${message.messageId}");
}

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  var initialzationSettingsAndroid = AndroidInitializationSettings("@mipmap/ic_launcher");
  channel = const AndroidNotificationChannel(
    "high_importance_channel",
    "Wiro Default Notification",
    description: "This channel is used for Wiro Mission Recommendation",
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);

  var initializationSettings = InitializationSettings(android: initialzationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

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
  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      var androidNotiDetails = AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
      );
      var details =
      NotificationDetails(android: androidNotiDetails);
      if (notification != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          details,
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print(message);
    });
    super.initState();
  }

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