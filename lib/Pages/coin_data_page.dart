
import 'package:flutter/material.dart';
import 'package:flutter_application_1/API/data.dart';
import 'package:flutter_application_1/Pages/main_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/data_controller.dart';


class CoinDataPage extends StatefulWidget {
  const CoinDataPage({Key? key}) : super(key: key);

  @override
  State<CoinDataPage> createState() => _CoinDataPageState();
}

class _CoinDataPageState extends State<CoinDataPage> {
  final DataController controller = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    
    return Obx((() => Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) =>  controller.filterCoin(value),
          decoration: const InputDecoration(
            filled: true,
            hintText: "Search",
            suffixIcon: Icon(Icons.search),
            )
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
            itemCount: controller.foundcoins.value.length,
            itemBuilder: (_, index) => Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
            child: DataView(index: index, data: controller.foundcoins.value),
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
    )));
  }
}



//all view


class DataView extends StatelessWidget {
  const DataView({Key? key, required this.index, required this.data,}) : super(key: key);

  final int index;
  final List<CoinList> data;

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
                  child: data[index].logoUrl.endsWith("svg")
                        ? SvgPicture.network(
                            data[index].logoUrl,
                            fit: BoxFit.fill,
                          ) :
                          Image.network(
                            data[index].logoUrl,
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
                Text(data[index].id),
                Text("${data[index].rank}.${data[index].id}"),
              ],
            )
          ),
          const VerticalDivider(),
          Expanded(
            flex: 3, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("\$${_price(data[index].price)}"),
                Text("\$${_milionBilion(data[index].marketCap)}"),
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
                      data[index].the1D.priceChangePct.contains("-") ? Icons.arrow_downward : Icons.arrow_upward,
                      color: data[index].the1D.priceChangePct.contains("-") ? Colors.red : Colors.green,
                    ),
                    Text(
                        data[index].the1D.priceChangePct.contains("-") ? ("\$${data[index].the1D.priceChangePct}") :  ("\$${data[index].the1D.priceChangePct}"),
                        style: TextStyle(
                          color: data[index].the1D.priceChangePct.contains("-") ? Colors.red : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
                Text("\$${(data[index].the1D.volume)}"),
              ],
            ),
            )
        ],
      ),
      )
    );

  }
}


//data number handle

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

