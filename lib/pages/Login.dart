import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:solutionchallengetem2_app/main.dart';
import '../firebase_options.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  SCAppState? scApp;

  @override
  Widget build(BuildContext context) {
    scApp = context.findAncestorStateOfType<SCAppState>();

    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: tryGoogleLogin,
                      child: Text("Login with Google")
                  )
                ]
            )
        )
    );
  }

  @override
  void initState() {
    super.initState();
    checkLastLogin();
  }

  void checkLastLogin() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if(user != null && scApp != null){
        print(user.uid);
        scApp!.setState(() {
          scApp!.isLoggedIn = true;
        });
      }
    });
  }

  void tryGoogleLogin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}