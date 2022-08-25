class StockAPI {
  String symbol;
  num open, high, low, close;
  List<String> stockNames = [
    'ADANIPORTS.BSE',
    'APOLLOHOSP.BSE',
    'ASIANPAINT.BSE',
    'AXISBANK.BSE',
    'BAJAJ-AUTO.BSE',
    'BAJAJFINSV.BSE',
    'BAJFINANCE.BSE',
    'BHARTIARTL.BSE',
    'BPCL.BSE',
    'BRITANNIA.BSE',
    'CIPLA.BSE',
    'COALINDIA.BSE',
    'DIVISLAB.BSE',
    'DRREDDY.BSE',
    'EICHERMOT.BSE',
    'GRASIM.BSE',
    'HCLTECH.BSE',
    'HDFC.BSE',
    'HDFCBANK.BSE',
    'HDFCLIFE.BSE',
    'HEROMOTOCO.BSE',
    'HINDALCO.BSE',
    'HINDUNILVR.BSE',
    'ICICIBANK.BSE',
    'INDUSINDBK.BSE',
    'INFY.BSE',
    'ITC.BSE',
    'JSWSTEEL.BSE',
    'KOTAKBANK.BSE',
    'LT.BSE',
    'M&M.BSE',
    'MARUTI.BSE',
    'NESTLEIND.BSE',
    'NTPC.BSE',
    'ONGC.BSE',
    'POWERGRID.BSE',
    'RELIANCE.BSE',
    'SBILIFE.BSE',
    'SBIN.BSE',
    'SHREECEM.BSE',
    'SUNPHARMA.BSE',
    'TATACONSUM.BSE',
    'TATAMOTORS.BSE',
    'TATASTEEL.BSE',
    'TCS.BSE',
    'TECHM.BSE',
    'TITAN.BSE',
    'ULTRACEMCO.BSE',
    'UPL.BSE',
    'WIPRO.BSE'
  ];

  StockAPI(
      {
      required this.symbol,
      required this.open,
      required this.high,
      required this.low,
      required this.close});



  factory StockAPI.fromJson(Map<String, dynamic> json) {
    return StockAPI(
        symbol: json["symbol"],
        open: json[],
        high: 300,
        low: 100,
        close: 250);
  }
}
