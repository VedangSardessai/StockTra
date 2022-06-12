import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInSuccess extends StatefulWidget {
  final AsyncSnapshot snapshot;
  final GoogleSignIn googleSignIn;

  const GoogleSignInSuccess(this.snapshot, this.googleSignIn);

  @override
  State<GoogleSignInSuccess> createState() => _GoogleSignInSuccessState();
}

class _GoogleSignInSuccessState extends State<GoogleSignInSuccess> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton.icon(
            onPressed: () async {
              await widget.googleSignIn.signOut();
              await FirebaseAuth.instance.signOut();
            },
            icon: FaIcon(FontAwesomeIcons.person),
            label: Text('Logout'),
          )
        ],
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          'Welcome ',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 25,
            letterSpacing: 10,
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
                backgroundImage:
                    NetworkImage(widget.snapshot.data!.photoURL.toString()),
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: size.width * .1,
            right: size.width * .1,
            child: Container(
              child: Text(
                widget.snapshot.data!.displayName +
                    ' you have signed in successfully :)',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 28,
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
        backgroundColor: Colors.black,
        items: [
          const BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: FaIcon(FontAwesomeIcons.bookmark),
            label: 'Watchlist',
          ),
          const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.book),
            label: 'Orders',
          ),
          const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.briefcase),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
              icon: const FaIcon(FontAwesomeIcons.powerOff),
              label: widget.snapshot.data.displayName.toString()),
        ],
      ),
    );
  }
}
