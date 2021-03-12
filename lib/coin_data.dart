import 'package:http/http.dart' as http;
import 'dart:convert';
import 'price_screen.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getCoinData(String selectedCurrency, String select) async {
    http.Response response = await http.get(
        'https://rest.coinapi.io/v1/exchangerate/$select/$selectedCurrency?apikey=8CE16A84-BE98-458C-ADED-8D7EF9F64FE3');
    var decodeData = jsonDecode(response.body);

    double rate = decodeData['rate'];
    return rate;
  }
}
