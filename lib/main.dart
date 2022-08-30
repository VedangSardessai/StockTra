import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'models/sign_in/google_sign_in_success.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GoogleSignInSuccess(snapshot, googleSignIn);
            } else {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  centerTitle: true,
                  title: Text(
                    'STOCKTRA',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      letterSpacing: 4,
                      fontSize: 30,
                    ),
                  ),
                ),
                body: Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  color: Colors.grey[900],
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 200,
                        child: DefaultTextStyle(
                          style: GoogleFonts.architectsDaughter(
                              fontSize: 25, color: Colors.white),
                          child: AnimatedTextKit(
                            isRepeatingAnimation: false,
                            animatedTexts: [
                              TyperAnimatedText(
                                "Welcome to StockTra an application to check prices of NIFTY 50 stocks and" +
                                    "to view articles on NIFTY published by various sources.",
                                speed: Duration(milliseconds: 80),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade800,
                        ),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  left: 10, top: 20, right: 10, bottom: 20),
                              child: Text(
                                'Please sign in using Google Sign in to access our application content ',
                                style: GoogleFonts.poppins(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black,
                                ),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: FaIcon(FontAwesomeIcons.google,
                                            color: Colors.grey[300]),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // color: Colors.black
                                        ),
                                        padding: EdgeInsets.all(15),
                                        child: GestureDetector(
                                          child: Text(
                                            'Sign in with Google',
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey[300],
                                                fontSize: 20),
                                          ),
                                          onTap: () async {
                                            final newUser =
                                                await googleSignIn.signIn();
                                            final googleAuth =
                                                await newUser!.authentication;
                                            final credentials =
                                                GoogleAuthProvider.credential(
                                              accessToken:
                                                  googleAuth.accessToken,
                                              idToken: googleAuth.idToken,
                                            );

                                            await FirebaseAuth.instance
                                                .signInWithCredential(
                                                    credentials);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 180,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10, top: 50, right: 10, bottom: 10),
                        child: DefaultTextStyle(
                          style: GoogleFonts.courgette(
                            fontSize: 23,
                            color: Colors.white70,
                          ),
                          child: AnimatedTextKit(
                            isRepeatingAnimation: false,
                            animatedTexts: [
                              TyperAnimatedText(
                                  speed: Duration(milliseconds: 80),
                                  'This Application is built by \n- Vedang Sardessai'),
                            ],
                          ),
                        ),
                      )
                    ],
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
