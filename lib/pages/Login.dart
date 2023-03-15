import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../firebase_options.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => {
                        FirebaseAuth.instance
                            .authStateChanges()
                            .listen((User? user) {
                          if (user == null) {
                            Future<UserCredential> signInWithGoogle() async {

                              // Trigger the authentication flow
                              final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

                              // Obtain the auth details from the request
                              final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

                              // Create a new credential
                              final credential = GoogleAuthProvider.credential(
                                accessToken: googleAuth?.accessToken,
                                idToken: googleAuth?.idToken,
                              );

                              // Once signed in, return the UserCredential
                              return await FirebaseAuth.instance.signInWithCredential(credential);
                            }
                            signInWithGoogle();
                          } else {
                            Navigator.pop(context);
                          }
                        })
                      },
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
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}