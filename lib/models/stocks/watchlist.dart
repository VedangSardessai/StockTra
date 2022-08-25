import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:yahoofin/yahoofin.dart';

import 'stock_cards.dart';

class Watchlist extends StatefulWidget {
  @override
  State<Watchlist> createState() => _WatchlistState();
}

class _WatchlistState extends State<Watchlist> {
  var _postsJson = [];

  static final DateTime today = DateTime.now();
  static final DateFormat format = DateFormat('MMM dd');
  final String formatted = StockCard.format.format(StockCard.today);

  void stocksAPI() async {
    List<String> stockNames = [
      'ADANIPORTS.NS',
      'APOLLOHOSP.NS',
      'ASIANPAINT.NS',
      'AXISBANK.NS',
      'BAJAJ-AUTO.NS',
      'BAJAJFINSV.NS',
      'BAJFINANCE.NS',
      'BHARTIARTL.NS',
      'BPCL.NS',
      'BRITANNIA.NS',
      'CIPLA.NS',
      'COALINDIA.NS',
      'DIVISLAB.NS',
      'DRREDDY.NS',
      'EICHERMOT.NS',
      'GRASIM.NS',
      'HCLTECH.NS',
      'HDFC.NS',
      'HDFCBANK.NS',
      'HDFCLIFE.NS',
      'HEROMOTOCO.NS',
      'HINDALCO.NS',
      'HINDUNILVR.NS',
      'ICICIBANK.NS',
      'INDUSINDBK.NS',
      'INFY.NS',
      'ITC.NS',
      'JSWSTEEL.NS',
      'KOTAKBANK.NS',
      'LT.NS',
      'M&M.NS',
      'MARUTI.NS',
      'NESTLEIND.NS',
      'NTPC.NS',
      'ONGC.NS',
      'POWERGRID.NS',
      'RELIANCE.NS',
      'SBILIFE.NS',
      'SBIN.NS',
      'SHREECEM.NS',
      'SUNPHARMA.NS',
      'TATACONSUM.NS',
      'TATAMOTORS.NS',
      'TATASTEEL.NS',
      'TCS.NS',
      'TECHM.NS',
      'TITAN.NS',
      'ULTRACEMCO.NS',
      'UPL.NS',
      'WIPRO.NS',
    ];

    List<String> open = [], high = [], low = [], close = [];

    for (int i = 0; i < 50; i++) {
      var yfin = YahooFin();
      StockHistory hist = yfin.initStockHistory(ticker: stockNames[i]);
      StockChart chart = await yfin.getChartQuotes(
          stockHistory: hist,
          interval: StockInterval.oneDay,
          period: StockRange.oneDay);
      // print(stockNames[i] +
      //     ' O: ' +
      //     chart.chartQuotes!.open.toString() +
      //     'H: ' +
      //     chart.chartQuotes!.high.toString() +
      //     'L: ' +
      //     chart.chartQuotes!.low.toString() +
      //     'C: ' +
      //     chart.chartQuotes!.close.toString());

      String unformattedOpen = chart.chartQuotes!.open.toString(),
          unformattedHigh = chart.chartQuotes!.high.toString(),
          unformattedLow = chart.chartQuotes!.low.toString(),
          unformattedClose = chart.chartQuotes!.close.toString();

      open.add(unformattedOpen.substring(1, unformattedOpen.length - 1));
      high.add(unformattedHigh.substring(1, unformattedHigh.length - 1));
      low.add(unformattedLow.substring(
          1, chart.chartQuotes!.low.toString().length - 1));
      close.add(unformattedClose.substring(
          1, chart.chartQuotes!.close.toString().length - 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'NIFTY 50 ',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[900],
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                formatted.toUpperCase(),
                style: GoogleFonts.poppins(
                  color: Colors.grey[300],
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            StockCard(
                symbol: 'ASIANPAINT',
                open: 333,
                high: 335,
                low: 330,
                close: 336),
            ElevatedButton(
              onPressed: stocksAPI,
              child: Text('Click'),
            )
          ],
        ),
      ),
    );
  }
}
