import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsCreen extends StatelessWidget {
  const NewsCreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'News',
        style: GoogleFonts.poppins(color: Colors.black, fontSize: 32),
      ),
    );
  }
}
