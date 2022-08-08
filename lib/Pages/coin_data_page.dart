import 'package:flutter/material.dart';
import 'package:flutter_application_1/API/data.dart';
import 'package:flutter_application_1/Pages/main_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../Api/data_controller.dart';


class CoinDataPage extends StatelessWidget {
  const CoinDataPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final DataController controller = Get.put(DataController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
            itemCount: controller.currencyList.length,
            itemBuilder: (_, index) => Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
            child: DataView(index: index, list: controller.currencyList),
        ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.grey,
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return const MainPage();
        }));
     },
     child: Icon(Icons.keyboard_backspace_outlined, color: Colors.black, size: 35,),
     ),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}



//all view


class DataView extends StatelessWidget {
  const DataView({Key? key, required this.index, required this.list,}) : super(key: key);

  final int index;
  final List<CoinList> list;
  
  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> SafeArea(
        child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex:2,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  child: list[index].logoUrl.endsWith("svg")
                        ? SvgPicture.network(
                            list[index].logoUrl,
                            fit: BoxFit.fill,
                          ) :
                          Image.network(
                            list[index].logoUrl,
                            fit: BoxFit.fill,
                          )
                )
              ],
            )
            ),
          Expanded(
            flex: 3, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(list[index].id),
                Text("${list[index].rank}.${list[index].id}"),
              ],
            )
          ),
          const VerticalDivider(),
          Expanded(
            flex: 3, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("\$${_price(list[index].price)}"),
                Text("\$${_milionBilion(list[index].marketCap)}"),
              ],
            )
          ),
          const VerticalDivider(),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      list[index].the1D.priceChangePct.contains("-") ? Icons.arrow_downward : Icons.arrow_upward,
                      color: list[index].the1D.priceChangePct.contains("-") ? Colors.red : Colors.green,
                    ),
                    Text(
                        list[index].the1D.priceChangePct.contains("-") ? ("\$${list[index].the1D.priceChangePct}") :  ("\$${list[index].the1D.priceChangePct}"),
                        style: TextStyle(
                          color: list[index].the1D.priceChangePct.contains("-") ? Colors.red : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
                Text("\$${_milionBilion(list[index].the1D.volume)}"),
              ],
            ),
            )
        ],
      ),
      )
    );

  }
}


//data handle

_milionBilion(String marketcap){
    String newMarketcap;
    if(6 >= marketcap.length){
      newMarketcap = marketcap.substring(0,3) + 'M';
    } else{
      newMarketcap = marketcap.substring(0, (marketcap.length - 9)) + 'B';
    }
  return newMarketcap;
}


_price(String price){
  String newPrice;
  newPrice = double.parse(price).toStringAsFixed(3);
  return newPrice;
}