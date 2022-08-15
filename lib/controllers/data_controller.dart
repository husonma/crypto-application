import 'package:flutter_application_1/API/api.dart';
import 'package:flutter_application_1/API/data.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  List<CoinList> currencyList = List<CoinList>.empty(growable: true).obs;
  var foundcoins = <CoinList>[].obs;
  
   @override
    void onInit() {
    getcurrency();
    super.onInit();
    foundcoins.value = currencyList;
  }

  void getcurrency() async {
    try {
     
      var data = await ApiHandler().getCurrencies();
      currencyList.assignAll(data);
    } on Exception catch (e){}
  }

   @override
  void onClose() {}
  void filterCoin(String coinName){
    List<CoinList> results = [];
    if(coinName.isEmpty){
      results = currencyList; 
    }
    else{
      results = currencyList.where((element) => element.id.toLowerCase().toString().contains(coinName.toLowerCase())).toList();
    }
      foundcoins.value = results;
    }

}
