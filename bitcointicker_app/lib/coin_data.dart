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
    //Use a for loop here to loop through the cryptoList and request the data for each of them in turn.
    Map cryptoPrices = {};
    for (String cryptoCoin in cryptoList) {
      //Return a Map of the results instead of a single value.
      //Update the URL to use the selectedCurrency input.
      http.Response response = await http.get(
        Uri.parse('$coinAPIURL/BTC/$selectedCurrency?apikey=$apiKey'),
      );
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double lastPrice = decodedData['rate'];
        cryptoPrices[cryptoCoin] = lastPrice.toStringAsFixed(2);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
