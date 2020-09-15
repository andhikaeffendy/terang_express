import 'package:flutter/cupertino.dart';
import 'package:terang_express/address.dart';
import 'package:terang_express/contact_us.dart';
import 'package:terang_express/home.dart';
import 'package:terang_express/profil.dart';
import 'package:terang_express/promo.dart';

import 'about_us.dart';

class Routes{
  static const String home = Home.routeName;
  static const String profil = Profil.routeName;
  static const String promo = Promo.routeName;
  static const String aboutUs = AboutUs.routeName;
  static const String contactUs = ContactUs.routeName;
  static const String address = Adress.routeName;

  static getRoutes(BuildContext context){
    return{
      home: (context) => Home(),
      profil: (context) => Profil(),
      promo: (context) => Promo(),
      aboutUs: (context) => AboutUs(),
      contactUs: (context) => ContactUs(),
      address: (context) => Adress(),
    };
  }
}
