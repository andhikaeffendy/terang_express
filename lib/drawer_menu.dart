import 'package:flutter/material.dart';
import 'package:terang_express/routes.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget> [
          UserAccountsDrawerHeader(
            accountEmail: Text('andhikaeffendy14@gmail.com'),
            accountName: Text(
              'Andhika Effendy'
            ),
            currentAccountPicture: CircleAvatar(
              child: Image.network('https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2020/06/14/314730607.jpg'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Home'
            ),
            onTap: () => Navigator.pushReplacementNamed(context, Routes.home),
          ),ListTile(
            leading: Icon(Icons.person),
            title: Text(
                'Profil'
            ),
            onTap: () => Navigator.pushReplacementNamed(context, Routes.profil),
          ),ListTile(
            leading: Icon(Icons.person),
            title: Text(
                'Promo'
            ),
            onTap: () => Navigator.pushReplacementNamed(context, Routes.promo),
          ),ListTile(
            leading: Icon(Icons.data_usage),
            title: Text(
                'Adress'
            ),onTap: () => Navigator.pushReplacementNamed(context, Routes.address),
          ),ListTile(
            leading: Icon(Icons.data_usage),
            title: Text(
                'About Us'
            ),onTap: () => Navigator.pushReplacementNamed(context, Routes.aboutUs),
          ),ListTile(
            leading: Icon(Icons.data_usage),
            title: Text(
                'Contact Us'
            ),onTap: () => Navigator.pushReplacementNamed(context, Routes.contactUs),
          ),ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
                'Sign Out'
            ),
          ),
        ],
      ),
    );
  }
}