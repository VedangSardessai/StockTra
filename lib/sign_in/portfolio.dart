import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Portfolio',
        style: GoogleFonts.poppins(color: Colors.black, fontSize: 32),
      ),
    );
  }
}
