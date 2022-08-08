import 'package:flutter_application_1/API/data.dart';
import 'package:http/http.dart' as http;


class ApiHandler {
  final String _apiKey = "75554f28a89363dc990ba501a1aedea08136b2da";
  final String _apiBaseUrl = "https://api.nomics.com/v1/currencies/ticker";

  Future getCurrencies() async {
    var body;
    final _url = _apiBaseUrl +
        "?key=$_apiKey";

    var response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      var json = response.body;
      return coinListFromJson(json);
    } else {
      print("where is data?");
    }

    return body.map((item) => CoinList.fromJson(item)).toList();
  }
}