import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'models/sign_in/google_sign_in_success.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GoogleSignInSuccess(snapshot, googleSignIn);
            }
             else {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.green,
                  centerTitle: true,
                  title: Text(
                    'STOCKTRA',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 30,
                        letterSpacing: 10,
                    ),
                  ),
                ),
                body: Center(
                  child: Card(
                    color: Colors.grey,
                    child: GestureDetector(
                      child: Container(
                        height: 70,
                        width: 200,
                        padding: EdgeInsets.all(15),
                        child: Text('Sign in here',
                            style: GoogleFonts.poppins(
                                color: Colors.black, fontSize: 25)),
                      ),
                      onTap: () async {
                        final newUser = await googleSignIn.signIn();
                        final googleAuth = await newUser!.authentication;
                        final credentials = GoogleAuthProvider.credential(
                          accessToken: googleAuth.accessToken,
                          idToken: googleAuth.idToken,
                        );

                        await FirebaseAuth.instance
                            .signInWithCredential(credentials);
                      },
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}