import 'package:flutter_application_1/API/api.dart';
import 'package:flutter_application_1/API/data.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  List<CoinList> currencyList = List<CoinList>.empty(growable: true).obs;

  @override
  void onInit() {
    getcurrency();
    super.onInit();
  }

  Future<void> getcurrency() async {
    try {
      var data = await ApiHandler().getCurrencies();
      currencyList.assignAll(data);
    } catch (e){}
  }
}