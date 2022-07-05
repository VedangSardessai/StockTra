import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Watchlist extends StatelessWidget {
  static final DateTime today = DateTime.now();
  static final DateFormat format = DateFormat('MMM dd');
  final String formatted = format.format(today);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              left: 5,
              top: 50,
              child: Text(
                'NIFTY 50 ',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: 7,
              top: 90,
              child: Text(
                formatted.toUpperCase(),
                style: GoogleFonts.poppins(
                  color: Colors.grey[500],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: 130,
              right: 10,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: "Search",
                  prefix: Icon(Icons.search),
                  fillColor: Colors.grey[800],
                  filled: true,
                ),
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// https://query1.finance.yahoo.com/v8/finance/chart/CDSL.NS