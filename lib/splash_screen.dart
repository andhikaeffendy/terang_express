import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
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

    _checkSession().then(
        (status){
          if ((status)) {
            _navigationToHome();
          }  else{
            _navigationToLogin();
          }
        }
    );
  }

  _navigationToLogin(){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => IntroScreen()
        )
    );
  }

  Future<bool> _checkSession() async {
    await Future.delayed(Duration(seconds: 3), (){});
    return false;
  }

  void _navigationToHome(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => Home()
      )
    );
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
