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
        String userToken = await user.getIdToken(false);
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