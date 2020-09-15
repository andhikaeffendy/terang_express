import 'package:flutter/material.dart';
import 'package:terang_express/drawer_menu.dart';

class Promo extends StatefulWidget {

  static const String routeName = '/promo';

  @override
  _PromoState createState() => _PromoState();
}

class _PromoState extends State<Promo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text(
          'Blank',
        ),centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: Text(
                'INI Blank'
              ),
            )
          ],
        ),
      ),
    );
  }
}
