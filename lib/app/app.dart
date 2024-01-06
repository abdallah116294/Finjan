import 'package:finjan/features/splash/screens/splashscreen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
 const  MyApp._internal();
static const  MyApp _instance =  MyApp._internal();
  factory MyApp() => _instance;
  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen()  ,
    );
  }
}