import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String state1 = '?';
  String state2 = '?';
  String state3 = '?';
  String selectedCurrency;
  void getData() async {
    double tate = await CoinData().getCoinData(selectedCurrency, cryptoList[0]);
    double tate2 = await CoinData().getCoinData(selectedCurrency, cryptoList[1]);
    double tate3 = await CoinData().getCoinData(selectedCurrency, cryptoList[2]);
    setState(() {
      state1 = tate.toStringAsFixed(0);
      state2 = tate.toStringAsFixed(0);
      state3 = tate.toStringAsFixed(0);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  List<Text> getListItem() {
    List<Text> listItem = [];
    for (String i in currenciesList) {
      listItem.add(Text(i));
    }
    return listItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Column(
                  children: [
                    Text(
                      '1 ${cryptoList[0]} = $state1 $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '1 ${cryptoList[1]} = $state2 $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '1 ${cryptoList[2]} = $state3 $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CupertinoPicker(
              itemExtent: 32.0,
              onSelectedItemChanged: (selected) {
                selectedCurrency = currenciesList[selected];
                getData();
              },
              children: getListItem(),
            ),
          ),
        ],
      ),
    );
  }
}
