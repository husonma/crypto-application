import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/coin_data_page.dart';
import 'package:flutter_application_1/Theme/theme_notifier.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';



class MainPage extends StatelessWidget{
    const MainPage({Key? key}) :super(key:key);

 final String coinData = 'Coin Data';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 100),
         child: ButtonMainWithNotificationIcon(),
       ),
          const SizedBox(height: 10,),
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 100),
         child: ButtonMain(title: coinData),
       ),
          const SizedBox(height: 10),
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 100),
         child: ButtonMainWithDarkIcon(),
       ),
      ],
      )
    );
  }
}


//after main

class ButtonMainWithDarkIcon extends StatelessWidget with _Colors, _PaddingUtility {
   ButtonMainWithDarkIcon({
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

class ButtonMainWithNotificationIcon extends StatelessWidget with _Colors, _PaddingUtility {
   ButtonMainWithNotificationIcon({
    Key? key, 
  }) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: blackColor,shape: const StadiumBorder()),
        onPressed:(){
          Get.snackbar("Hello Gus", "You're now online");
        },
        child: Padding(
          padding: iconPadding,
          child: const SizedBox(width: 170, child: Center(child: Icon(Icons.notifications_none)),
        ))
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
      if(title == 'Coin Data'){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return const CoinDataPage();
        }));
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


