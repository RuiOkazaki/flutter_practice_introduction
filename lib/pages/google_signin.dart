import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_introduction/components/header.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignin extends StatefulWidget {
  const GoogleSignin({super.key});

  @override
  State<GoogleSignin> createState() => _GoogleSigninState();
}

class _GoogleSigninState extends State<GoogleSignin> {
  String _displayName = '';

  static final googleLogin = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: genHeader('google signin'),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "hello! $_displayName",
              style: const TextStyle(fontSize: 50),
            ),
            TextButton.icon(
              label: const Text('login'),
              icon: const Icon(Icons.login),
              onPressed: () async {
                GoogleSignInAccount? signinAccount = await googleLogin.signIn();
                if (signinAccount == null) return;

                GoogleSignInAuthentication auth =
                    await signinAccount.authentication;

                final OAuthCredential credential =
                    GoogleAuthProvider.credential(
                  idToken: auth.idToken,
                  accessToken: auth.accessToken,
                );

                User? user = (await FirebaseAuth.instance
                        .signInWithCredential(credential))
                    .user;

                if (user != null) {
                  setState(() {
                    _displayName = user.displayName!;
                  });
                }
              },
            )
          ],
        )));
  }
}
