import 'package:flutter/material.dart';

class StockAPI extends StatefulWidget{
  List<String> symbol, open, high, low, close;

  StockAPI(
      {
      required this.symbol,
      required this.open,
      required this.high,
      required this.low,
      required this.close});

  @override
  State<StockAPI> createState() => _StockAPIState();
}

class _StockAPIState extends State<StockAPI> {
  Widget build(BuildContext context){
    return Container(

    );
  }
}
