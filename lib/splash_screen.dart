import 'dart:async';
import 'package:flutter/material.dart';
import 'package:terang_express/globals/session.dart';
import 'package:terang_express/globals/variable.dart';
import 'package:terang_express/home.dart';
import 'package:terang_express/introduction_screen.dart';
import 'package:terang_express/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();

    checkSession();
  }

  delay(int second) async {
    await Future.delayed(Duration(seconds: second), (){});
  }

  checkSession() async {
    await delay(3);
    startNewPage(context, await loadSession() ? Home() : await skipIntro() ? Login() : IntroScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xFFa20000),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo_small.png',
                  width: 200.0,
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
