import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/coin_data_page.dart';
import 'package:flutter_application_1/Theme/theme_notifier.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';



class MainPage extends StatelessWidget{
    const MainPage({Key? key}) :super(key:key);

 final String _notify = 'notification';
 final String coinData = 'coin data';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 100),
         child: ButtonMain(title: _notify),
       ),
          const SizedBox(height: 10,),
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 100),
         child: ButtonMain(title: coinData),
       ),
          const SizedBox(height: 10),
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 100),
         child: ButtonMainWithIcon(),
       ),
      ],
      )
    );
  }
}


//after main

class ButtonMainWithIcon extends StatelessWidget with _Colors, _PaddingUtility {
   ButtonMainWithIcon({
    Key? key, 
  }) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: blackColor,shape: const StadiumBorder()),
        onPressed:(){
          //normalde
          context.read<ThemeNotifier>().changeTheme();
        },
        child: Padding(
          padding: iconPadding,
          child: const SizedBox(width: 170, child: Center(child: Icon(Icons.dark_mode_outlined))),
        )
       );
  }
}


class ButtonMain extends StatelessWidget with _Colors, _PaddingUtility {
   ButtonMain({
    Key? key,
     required this.title
  }) :  super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
     style: ElevatedButton.styleFrom(primary: blackColor, shape: const StadiumBorder()),
     onPressed:(){
      //navigation to coin page
      if(title == 'coin data'){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return const CoinDataPage();
        }));
      }
      //notification
      if(title == 'notification'){
        Get.snackbar("Hello Gus", "You're now online");
        
      }
     },

     child: Center(
      child: Padding(
        padding: normalPadding,
        child: SizedBox(width: 170, child: Center(child: Text(title))),
      ))
    );
  }
}

class _Colors{
  final Color blackColor = Colors.black;

}

class _PaddingUtility {
   final EdgeInsets normalPadding = const EdgeInsets.all(22.0);
   final EdgeInsets iconPadding = const EdgeInsets.all(18.0);
}


