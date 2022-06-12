import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:for_x/navigation/profile.dart';
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
  int currentIdx = 0;


  @override
  Widget build(BuildContext context) {
    final screens = [
      Center(
        child: Text(
          'Watchlist',
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 32),
        ),
      ),
      Center(
        child: Text(
          'Orders',
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 32),
        ),
      ),
      Center(
        child: Text(
          'Portfolio',
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 32),
        ),
      ),

      Profile(widget.googleSignIn , widget.snapshot)

    ];
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   TextButton.icon(
        //     onPressed: () async {
        //       await widget.googleSignIn.signOut();
        //       await FirebaseAuth.instance.signOut();
        //     },
        //     icon: FaIcon(FontAwesomeIcons.person),
        //     label: Text('Logout'),
        //   )
        // ],
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
      body: screens[currentIdx],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 28,
        selectedFontSize: 17,
        unselectedFontSize: 14,
        currentIndex: currentIdx,
        onTap: (index) => setState(() => currentIdx = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bookmark),
            label: 'Watchlist',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.book),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: FaIcon(FontAwesomeIcons.briefcase),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
