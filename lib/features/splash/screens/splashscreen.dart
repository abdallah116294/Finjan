import 'dart:async';
import 'package:finjan/core/utils/appcolor.dart';
import 'package:finjan/features/auth/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  gotNext() => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>  RegisterScreen()));
  startDely() {
    _timer = Timer(const Duration(seconds: 7), () {
      gotNext();
    });
  }

  @override
  void initState() {
    startDely();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          Lottie.asset('assets/splash.json')
        ],
      ),
    );
  }
}
