import 'package:http/http.dart' as http;
import 'dart:convert';

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

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'AFA47D1D-1C56-49D9-B5BC-5864E68002AC';

class CoinData {
  //Update getCoinData to take the selectedCurrency as an input.
  Future getCoinData(String selectedCurrency) async {
    //Update the URL to use the selectedCurrency input.
    http.Response response = await http.get(
      Uri.parse('$coinAPIURL/BTC/$selectedCurrency?apikey=$apiKey'),
    );
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice.toStringAsFixed(2);
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
