import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Watchlist extends StatelessWidget {
  const Watchlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Watchlist',
        style: GoogleFonts.poppins(color: Colors.black, fontSize: 32),
      ),
    );
    ;
  }
}
