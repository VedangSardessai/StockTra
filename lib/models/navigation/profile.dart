import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Profile extends StatelessWidget {
  final GoogleSignIn googleSignIn;
  final AsyncSnapshot snapshot;

  Profile(this.googleSignIn, this.snapshot);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return 
      Scaffold(
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
        body: Stack(
        children: [
          Positioned(
            left: size.width * .4,
            height: 100,
            width: 100,
            top: 30,
            child: Center(
              child: CircleAvatar(
                minRadius: 30,
                backgroundImage: NetworkImage(snapshot.data!.photoURL.toString()),
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 25,
            right: 25,
            child: Container(
              child: Text(
                'Hello ' +
                    snapshot.data!.displayName +
                    ' you have signed in successfully :)',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 28,
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            top: size.height*.7,
            left: 20,
            right: 20,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                padding: EdgeInsets.all(10)
              ),
              label: Text(
                'Log Out',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              icon: FaIcon(FontAwesomeIcons.powerOff),
              onPressed: () async {
                await googleSignIn.signOut();
                await FirebaseAuth.instance.signOut();
              },
            ),
          )
        ],
    ),
      );
  }
}
