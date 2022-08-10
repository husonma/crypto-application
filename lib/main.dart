import 'package:flutter/material.dart';
import 'package:flutter_application_1/Theme/theme_notifier.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'Pages/main_page.dart';



void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<ThemeNotifier>(create: (context)=> ThemeNotifier()),
    ],
    builder: (context, child)=> const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        theme: context.watch<ThemeNotifier>().currentTheme,
        home:const MainPage(),
      );
  }
}


  
  

 


