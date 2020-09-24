import 'package:flutter/material.dart';
import 'package:terang_express/globals/variable.dart';
import 'package:terang_express/login.dart';

class Aktifasi extends StatefulWidget {
  @override
  _AktifasiState createState() => _AktifasiState();
}

class _AktifasiState extends State<Aktifasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFFa20000),
          ),
          Center(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo_small.png',
                      width: 200.0,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 40.0,
                    ),Container(
                      width: MediaQuery.of(context).size.width*0.7,
                      child: Text(
                        'Registrasi anda telah berhasil',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                    ),SizedBox(
                      height: 24.0,
                    ),ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width*0.6,
                      child: FlatButton(
                        color: Colors.white,
                        padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                        onPressed: () => startNewPage(context, Login()),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
