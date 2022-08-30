import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:for_x/models/sign_in/my_google_signin.dart';
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
    return GoogleSignInTry();
  }
}
