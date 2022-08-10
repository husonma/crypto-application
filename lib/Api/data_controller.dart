import 'package:flutter_application_1/API/api.dart';
import 'package:flutter_application_1/API/data.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  var isLoading = true.obs;
  List<CoinList> currencyList = List<CoinList>.empty(growable: true).obs;
  
  @override
  void onInit() {
    getcurrency();
    super.onInit();
  }

  void getcurrency() async {
    try {
      isLoading(true);
      var data = await ApiHandler().getCurrencies();
      currencyList.assignAll(data);
    } on Exception catch (e){}
    isLoading(false);
  }
}
