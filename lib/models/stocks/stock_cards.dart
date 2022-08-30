import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class StockCard extends StatelessWidget {
  String symbol;
  String open, high, low, close;

  static final DateTime today = DateTime.now();
  static final DateFormat format = DateFormat('MMM dd');
  final String formatted = StockCard.format.format(StockCard.today);

  StockCard(
      {required this.symbol,
      required this.open,
      required this.high,
      required this.low,
      required this.close});

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black,
                offset: Offset(4, 4),
                blurRadius: 22,
                spreadRadius: 1),
            BoxShadow(
                color: Colors.black,
                offset: Offset(-4, -4),
                blurRadius: 22,
                spreadRadius: 1),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        symbol,
                        style: GoogleFonts.poppins(
                          fontSize: size.width * .045,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: RichText(
                    text: TextSpan(
                        text: "O: " + open.toString() + "  ",
                        style: GoogleFonts.poppins(
                            fontSize: size.width * .045,
                            color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'H: ' + high.toString() + '  ',
                            style: GoogleFonts.poppins(
                              fontSize: size.width * .045,
                              color: Colors.green,
                            ),
                          ),
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: RichText(
                    text: TextSpan(
                      text: "L: " + low.toString() + "  ",
                      style: GoogleFonts.poppins(
                        fontSize: size.width * .045,
                        color: Colors.red,
                      ),
                      children: [
                        TextSpan(
                          text: 'C: ' + close.toString() + "  ",
                          style: GoogleFonts.poppins(
                            fontSize: size.width * .045,
                            // fontWeight: FontWeight.bold,
                            color: double.parse(close) > double.parse(open)
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
