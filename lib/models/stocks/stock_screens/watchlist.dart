import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:yahoofin/yahoofin.dart';

import '../stock_cards.dart';

class Watchlist extends StatefulWidget {
  const Watchlist({Key? key}) : super(key: key);

  @override
  State<Watchlist> createState() => _WatchlistState();
}

class _WatchlistState extends State<Watchlist> {
  static final DateFormat format = DateFormat('MMM dd');
  final String formatted = StockCard.format.format(StockCard.today);
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
  List<String> finalOpen = [], finalHigh = [], finalLow = [], finalClose = [];
  int i = 0;

  Future<void> stocksAPI() async {
    open.clear();
    high.clear();
    low.clear();
    close.clear();
    for (int i = 0; i < 50; i++) {
      var yfin = YahooFin();
      StockHistory hist = yfin.initStockHistory(ticker: stockNames[i]);
      StockChart chart = await yfin.getChartQuotes(
          stockHistory: hist,
          interval: StockInterval.oneDay,
          period: StockRange.oneDay);

      String unformattedOpen = chart.chartQuotes!.open.toString(),
          unformattedHigh = chart.chartQuotes!.high.toString(),
          unformattedLow = chart.chartQuotes!.low.toString(),
          unformattedClose = chart.chartQuotes!.close.toString();

      // print(stockNames[i] +
      //     ' -> O: ' +
      //     unformattedOpen +
      //     ' H:' +
      //     unformattedHigh +
      //     ' L:' +
      //     unformattedLow +
      //     ' C:' +
      //     unformattedClose);

      open.add(unformattedOpen.substring(1, unformattedOpen.indexOf('.') + 2));
      high.add(unformattedHigh.substring(1, unformattedHigh.indexOf('.') + 2));
      low.add(unformattedLow.substring(1, unformattedLow.indexOf('.') + 2));
      close.add(
          unformattedClose.substring(1, unformattedClose.indexOf('.') + 2));
    }
    // print(open);

    setState(
      () {
        i = 1;
        // print('Set State Done');
      },
    );
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
            letterSpacing: 5
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[900],
        width: double.infinity,
        height: double.infinity,
        child: LiquidPullToRefresh(
            color: Colors.grey[800],
            height: 80,
            onRefresh: stocksAPI,
            child: i == 1
                ? ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return StockCard(
                          symbol: stockNames[index]
                              .substring(0, stockNames[index].length - 3),
                          open: open[index],
                          high: high[index],
                          low: low[index],
                          close: close[index]);
                    },
                    itemCount: 50,
                  )
                : ListView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'Pull Down to load stocks',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 32,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )

            // ElevatedButton(
            //   child: Text(i.toString()),
            //   onPressed: () {
            //     // setStocks();
            //     // if(flag == 1)
            //     //   print(open);
            //     stocksAPI();
            //   },
            // )
            ),
      ),
    );
  }
}
