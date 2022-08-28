import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Orders',
        style: GoogleFonts.poppins(color: Colors.black, fontSize: 32),
      ),
    );
  }
}
