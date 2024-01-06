import 'package:finjan/features/auth/presentation/cubit/register_cubit.dart';
import 'package:finjan/features/splash/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:finjan/injection_container.dart" as di;

class MyApp extends StatelessWidget {
 const  MyApp._internal();
static const  MyApp _instance =  MyApp._internal();
  factory MyApp() => _instance;
  @override
  Widget build(BuildContext context) {
    return   MultiBlocProvider(providers: [
      BlocProvider(create: (context)=>di.sl<RegisterCubit>())
    ], child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen()  ,
    ));
  }
}